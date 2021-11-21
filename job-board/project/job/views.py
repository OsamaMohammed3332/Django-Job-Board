from django.shortcuts import redirect, render
from .models import Job
from django.core.paginator import Paginator
from .forms import Apply, JobForm
from django.contrib.auth.decorators import login_required
from .filter import JobFilter
# Create your views here.

def job_list(request):
    jobs_list = Job.objects.all()

    my_filter = JobFilter(request.GET, queryset= jobs_list)
    jobs_list = my_filter.qs

    paginator = Paginator(jobs_list, 3) # Show jobs per page.

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'jobs': page_obj,
        'count': jobs_list,
        'my_filter': my_filter,
    }
    return render(request, 'jobs.html', context)


def job_detail(request, slug):
    jobs_detail = Job.objects.get(slug=slug)

    if request.method == 'POST':
        form = Apply(request.POST, request.FILES)
        if form.is_valid():
            my_form  = form.save(commit=False)
            my_form.job = jobs_detail
            my_form.user = request.user
            my_form.save()

    else:
        form = Apply()


    context = {
        'job': jobs_detail,
        'form': form,
    }
    return render(request, 'job_details.html', context)

@login_required
def add_job(request):
    if request.method == 'POST':
        form = JobForm(request.POST, request.FILES)
        if form.is_valid():
            my_form  = form.save(commit=False)
            my_form.owner = request.user
            my_form.save()
            return redirect("jobs")

    else:
        form = JobForm()


    return render(request, 'add_job.html', {'form': form})

