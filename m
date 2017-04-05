Content-Type: multipart/mixed; boundary="===============7104076255306305142=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: qemu how-to?
Date: Wed, 05 Apr 2017 09:16:56 +0800
Message-ID: <87bmsbhcvr.fsf@yhuang-dev.intel.com>
In-Reply-To: <87bmsdlhob.fsf@dmlp.sw.ru>
List-Id: <oe-lkp.lists.linux.dev>

--===============7104076255306305142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dmitry Monakhov <dmonakhov@openvz.org> writes:

> Hi,
>
> lkp-test project has nice howto about local case. But I want to run
> lkp inside qemu in order to get beter resource utilization.
> Unfortunetly it is not obvious how to do that. I've tried =

> #lkp split jobs/hackbench.yaml
> #lkp compile hackbench-50%-threads-socket.yaml > job.yaml.sh
> #lkp qemu -k $my-kernel//arch/x86/boot/bzImage job.yaml.sh

lkp qemu is mainly for boot test now.  For performance test like
hackbench, you need to run lkp-tests inside the qemu.  Something like,

start the qemu, login into the Linux in qemu, then

# cd $lkp-tests
# make install
# lkp install jobs/hackbench.yaml
# lkp run xxx.yaml # one split job

> It gives me a lot of errors and exit, It's looks like script expect some
> magic enviroment variables to be configured before run.
> Can you please explain how to do that, or share your autostart script.
>
> Can you please do that on clean enviroment debian enviroment (for
> example inside docker container), so very first commands are
> # docker run --rm -it --privileged debian:sid
> #$ apt-get update
> #$ apt-get install git make -y
> #$ git clone https://github.com/01org/lkp-tests
> #$ cd lkp-tests
> #$ make install
>
>
> BTW It would be nice to have this info in README file. Because IFAIU
> many people want to ask this question again and again.

Thanks for your suggestion.  We will do that.

Best Regards,
Huang, Ying

--===============7104076255306305142==--

