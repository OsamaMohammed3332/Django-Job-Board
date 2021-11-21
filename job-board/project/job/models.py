from django.db import models
from django.utils.text import slugify
from django.contrib.auth.models import User
# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=25)
    
    def __str__(self):
        return self.name


def image(instance, filename):
    imagename, extension = filename.split('.')
    return "photo/%s.%s"%(instance.id, extension)




class Job(models.Model):
    type = [
        ('Full Time','Full Time'),
        ('Part Time','Part Time'),
    ]



    owner = models.ForeignKey(User, related_name='job_owner', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    job_type = models.CharField(max_length=20, choices=type)
    description = models.TextField(max_length=1000)
    published_at = models.DateTimeField(auto_now=True)
    vacancy = models.IntegerField(null=True, blank=True, default=1)
    salary = models.IntegerField(default=0, null=True, blank=True)
    experience = models.IntegerField(default=1, null=True, blank=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to=image, null=True, blank=True)
    slug = models.SlugField(null=True, blank=True)


    def save(self, *args, **keyargs):
        self.slug = slugify(self.title)
        super(Job, self).save(*args, **keyargs)


    def __str__(self):
        return self.title



class Apply_job(models.Model):
    job = models.ForeignKey(Job, related_name='apply_job', on_delete=models.CASCADE)
    name = models.CharField(max_length=25)
    email = models.EmailField(max_length=150)
    website = models.URLField(blank=True)
    cv = models.FileField(upload_to='apply/%y/%m/%d')
    text = models.TextField(max_length=200)
    created_at = models.DateTimeField(auto_now=True)
    user = models.ForeignKey(User, related_name='apply_user', on_delete=models.CASCADE)



    def __str__(self):
        return self.name
