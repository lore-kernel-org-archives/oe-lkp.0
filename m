Content-Type: multipart/mixed; boundary="===============4187951904441959465=="
MIME-Version: 1.0
From: Dmitry Monakhov <dmonakhov@openvz.org>
To: lkp@lists.01.org
Subject: Re: qemu how-to?
Date: Wed, 05 Apr 2017 10:34:23 +0300
Message-ID: <87vaqjjojk.fsf@dmlp.sw.ru>
In-Reply-To: <87bmsbhcvr.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4187951904441959465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Huang, Ying" <ying.huang@intel.com> writes:

> Dmitry Monakhov <dmonakhov@openvz.org> writes:
>
>> Hi,
>>
>> lkp-test project has nice howto about local case. But I want to run
>> lkp inside qemu in order to get beter resource utilization.
>> Unfortunetly it is not obvious how to do that. I've tried =

>> #lkp split jobs/hackbench.yaml
>> #lkp compile hackbench-50%-threads-socket.yaml > job.yaml.sh
>> #lkp qemu -k $my-kernel//arch/x86/boot/bzImage job.yaml.sh
>
> lkp qemu is mainly for boot test now.  For performance test like
> hackbench, you need to run lkp-tests inside the qemu.  Something like,
In fact my primarry interest are functional tests.
I want to check that patches before submission to LKML.
So the only thing I do care is total time of validation.
For that reason it is reasonable to split full autotest/validation
job to indepented peaces and run them in parallel in different
qemu VMs. I use this trick for xfstests-bld and it drops test time to
3minutes instead of 3600min if all tests runs sequentially.

BTW1: https://github.com/tytso/xfstests-bld is a good example of
hermetic kvm enviroment for xfstests execution.

BTW2: It would be nice to have syntax checkers ala
sparse/smatch/checkpatch.pl run as part of autotest, but
commit 52a4a8c490fa and 0b8003f06 remove smatch and sparse
with statement that "We already has smatch test for kernel", but
I can not find it. How I can run syntax checkers from LKP-tests?
>
> start the qemu, login into the Linux in qemu, then
>
> # cd $lkp-tests
> # make install
> # lkp install jobs/hackbench.yaml
> # lkp run xxx.yaml # one split job
>
>> It gives me a lot of errors and exit, It's looks like script expect some
>> magic enviroment variables to be configured before run.
>> Can you please explain how to do that, or share your autostart script.
>>
>> Can you please do that on clean enviroment debian enviroment (for
>> example inside docker container), so very first commands are
>> # docker run --rm -it --privileged debian:sid
>> #$ apt-get update
>> #$ apt-get install git make -y
>> #$ git clone https://github.com/01org/lkp-tests
>> #$ cd lkp-tests
>> #$ make install
>>
>>
>> BTW It would be nice to have this info in README file. Because IFAIU
>> many people want to ask this question again and again.
>
> Thanks for your suggestion.  We will do that.
>
> Best Regards,
> Huang, Ying

--===============4187951904441959465==--

