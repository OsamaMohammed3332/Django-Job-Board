from django import forms
from .models import Apply_job, Job

class Apply(forms.ModelForm):
    class Meta:
        model = Apply_job
        fields = ['name', 'email', 'website', 'cv', 'text']




class JobForm(forms.ModelForm):
    class Meta:
        model = Job
        fields = '__all__'
        exclude = ('slug', 'owner')
