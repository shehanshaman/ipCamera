from django import template                                                                                                                                                        
from django.template.defaultfilters import stringfilter

from datetime import datetime
from django.utils.timesince import timesince

register = template.Library()

@register.filter
def return_item(l, i):
    try:
        return l[i]
    except:
        return None
