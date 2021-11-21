from rest_framework import serializers
from rest_framework.fields import SerializerMethodField
from job.models import Job, Apply_job

class JobSerializer(serializers.ModelSerializer):
    username = serializers.SerializerMethodField('get_username_from_owner')
    class Meta:
        model = Job
        fields = [
            'title',
            'job_type',
            'description',
            'vacancy',
            'salary',
            'experience',
            'category',
            'photo',
            'slug',
            'username'
            ]
    def get_username_from_owner(self, job_user):
        username = job_user.owner.username
        return username



class ApplySerializer(serializers.ModelSerializer):
    class Meta:
        model = Apply_job
        fields = ['name', 'email', 'website', 'cv', 'text']