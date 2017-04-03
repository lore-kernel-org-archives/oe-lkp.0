Content-Type: multipart/mixed; boundary="===============6760059203545340500=="
MIME-Version: 1.0
From: Dmitry Monakhov <dmonakhov@openvz.org>
To: lkp@lists.01.org
Subject: qemu how-to?
Date: Mon, 03 Apr 2017 16:55:16 +0300
Message-ID: <87bmsdlhob.fsf@dmlp.sw.ru>
List-Id: <oe-lkp.lists.linux.dev>

--===============6760059203545340500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

lkp-test project has nice howto about local case. But I want to run
lkp inside qemu in order to get beter resource utilization.
Unfortunetly it is not obvious how to do that. I've tried =

#lkp split jobs/hackbench.yaml
#lkp compile hackbench-50%-threads-socket.yaml > job.yaml.sh
#lkp qemu -k $my-kernel//arch/x86/boot/bzImage job.yaml.sh
It gives me a lot of errors and exit, It's looks like script expect some
magic enviroment variables to be configured before run.
Can you please explain how to do that, or share your autostart script.

Can you please do that on clean enviroment debian enviroment (for
example inside docker container), so very first commands are
# docker run --rm -it --privileged debian:sid
#$ apt-get update
#$ apt-get install git make -y
#$ git clone https://github.com/01org/lkp-tests
#$ cd lkp-tests
#$ make install


BTW It would be nice to have this info in README file. Because IFAIU
many people want to ask this question again and again.


--===============6760059203545340500==--

