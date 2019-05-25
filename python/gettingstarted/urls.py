from django.urls import path, include

from django.contrib import admin

admin.autodiscover()

import hello.views

# To add a new path, first import the app:
# import blog
#
# Then add the new path:
# path('blog/', blog.urls, name="blog")
#
# Learn more here: https://docs.djangoproject.com/en/2.1/topics/http/urls/

urlpatterns = [
    path("", hello.views.index, name="index"),
    # path("login/", hello.views.login, name="login"),
    path("logout/", hello.views.logout, name="logout"),
    # path("db/", hello.views.db, name="db"),
    path("test/", hello.views.test, name="test"),
    path("read/", hello.views.read, name="read"),
    # path("update/", hello.views.update, name="update"),
    path("admin/", admin.site.urls),
]
