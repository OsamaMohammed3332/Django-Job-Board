from django.shortcuts import render
from job.models import Job
# Create your views here.


def home(request):
    jobs_list = Job.objects.all()
    return render(request, 'home.html', {'count': jobs_list,})