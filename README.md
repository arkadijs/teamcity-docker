#### [TeamCity] server and agent Docker images

The images is based on [phusion/baseimage] so it has proper boot sequence and  process supervision.

phusion/baseimage is Ubuntu 14.04 LTS based image with [runit] init, cron, syslog-ng, and [sshd].

Start server:

    docker run -ti --rm \
        -p 8111:8111 \
        -v /var/teamcity:/data \
        arkadi/teamcity-server \
        /sbin/my_init -- bash -l

Start agent(s):

    docker run -ti --rm \
        -p 9090:9090 \
        -v /tmp/teamcity-agent:/data \
        -e TEAMCITY_SERVER=http://192.168.1.2:8111/ \
        -e AGENT_NAME=agent-1 \
        arkadi/teamcity-agent \
        /sbin/my_init -- bash -l

- UI will be on port 8111 (HTTP).
- The server data will be under /var/teamcity.
- TEAMCITY_SERVER and AGENT_NAME are mandatory. AGENT_NAME must be unique.
- Agent's `-p 9090:9090` mapping is not required when running on single machine.
- `/sbin/my_init -- bash -l` is optional to enter container with shell at startup.
- [sshd] is not enabled.
- Superuser login into TeamCity requires auth token. Grab it from server container's log. Check [teamcity-token.service] for example.

[TeamCity]: https://www.jetbrains.com/teamcity/
[phusion/baseimage]: http://phusion.github.io/baseimage-docker/
[runit]: http://smarden.org/runit/
[sshd]: https://github.com/phusion/baseimage-docker#login-to-the-container-or-running-a-command-inside-it-via-ssh
[teamcity-token.service]: https://github.com/arkadijs/teamcity-docker/blob/master/teamcity-token.service
