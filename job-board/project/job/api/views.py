from job.models import Job, Apply_job
from .serializers import JobSerializer, ApplySerializer
from rest_framework.response import Response
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework import generics
from rest_framework import status
from rest_framework.authentication import BasicAuthentication, SessionAuthentication, TokenAuthentication
from rest_framework.filters import  SearchFilter, OrderingFilter
from rest_framework.pagination import PageNumberPagination



# With Function Based Views

@api_view(['GET', ])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated,])
def job_list_api(request):
    all_jobs = Job.objects.all()
    data = JobSerializer(all_jobs, many=True).data
    return Response({'data': data})


@api_view(['GET'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated,])
def job_detail_api(request, slug):

    try:
        job_detail = Job.objects.get(slug=slug)
        
    except Job.DoesNotExist:
        return Response(status = status.HTTP_404_NOT_FOUND) 

    if request.method == 'GET':
        data = JobSerializer(job_detail).data
        return Response({'data': data})


@api_view(['POST'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated,])
def job_create_api(request):
    account = request.user
    job_owner = Job(owner=account)
    if request.method == 'POST':
        serializer = JobSerializer(job_owner, data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
    
        return Response(serializer.errors, status= status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated,])
def apply_job_api(request, slug):
    jobs_detail = Job.objects.get(slug=slug)
    apply = Apply_job(job=jobs_detail, user =request.user)
    if request.method == 'POST':
        serializer = ApplySerializer(apply, data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
    
        return Response(serializer.errors, status= status.HTTP_400_BAD_REQUEST)
        

@api_view(['DELETE'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated,])
def delete_job(request, slug):
    try:
        job_detail = Job.objects.get(slug=slug)
    
    except Job.DoesNotExist:
        return Response(status = status.HTTP_404_NOT_FOUND) 

    user = request.user
    if job_detail.owner != user:
        return Response({"response": "You don't have permission to delete that"})

    if request.method == 'DELETE':
        operation = job_detail.delete()
        data = {}
        if operation:
            data['success'] = 'delete successful'
        else:
            data['failure'] = 'delete failed'
        return Response(data=data)




# With Generic Views
class job_list_with_pagination(generics.ListCreateAPIView):
    queryset = Job.objects.all()
    serializer_class = JobSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    # if (ListAPIView) you will add (pagination_class = PageNumberPagination)


class filter(generics.ListAPIView):
    queryset = Job.objects.all()
    serializer_class = JobSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    pagination_class = PageNumberPagination
    filter_backends = [SearchFilter, OrderingFilter]
    search_fields = ['title', 'job_type', 'description', 'owner__username']


class job_detail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Job.objects.all()
    serializer_class = JobSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    lookup_field = 'slug'

