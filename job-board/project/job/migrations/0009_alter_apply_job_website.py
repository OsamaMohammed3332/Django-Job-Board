# Generated by Django 3.2.7 on 2021-09-12 11:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0008_alter_apply_job_website'),
    ]

    operations = [
        migrations.AlterField(
            model_name='apply_job',
            name='website',
            field=models.URLField(blank=True, null=True),
        ),
    ]
