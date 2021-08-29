FROM nginx
COPY app1.html /usr/share/nginx/html/index.html
# Following command will be needed if we wanted to have any custom configuration for the nginx but for this case. We can ignore.
# COPY nginx.conf /etc/nginx/nginx.conf