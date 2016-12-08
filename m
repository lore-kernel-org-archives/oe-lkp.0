Content-Type: multipart/mixed; boundary="===============3337039943803122561=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, paravirt] fd6f48529f: aim7.jobs-per-min -26.1% regression
Date: Thu, 08 Dec 2016 09:12:36 +0800
Message-ID: <87y3zrkyuz.fsf@yhuang-dev.intel.com>
In-Reply-To: <20161207131740.GY3092@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3337039943803122561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Peter Zijlstra <peterz@infradead.org> writes:

> On Thu, Dec 01, 2016 at 02:07:29AM +0800, kernel test robot wrote:
>> =

>> Greeting,
>> =

>> FYI, we noticed a -26.1% regression of aim7.jobs-per-min due to commit:
>> =

>> =

>> commit: fd6f48529f4067c6bfbead88d3d7d117d51150f6 ("x86,paravirt: Optimiz=
e native pv_lock_ops.vcpu_is_preempted")
>> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking=
/core
>> =

>> in testcase: aim7
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 4 -m 5G
>> with following parameters:
>> =

>> 	test: link_test
>> 	load: 2000
>> =

>> test-description: AIM7 is a traditional UNIX system level benchmark
>> suite which is used to test and measure the performance of multiuser
>> system.
>> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
>> =

>
> OK, so I'm having a very hard time reproducing this. How can I run this
> link_test stuff when I got aim7 compiled? This is all impenetrable gunk
> to me.
>

Sorry, the reproduce script wasn't attached in the original email, here
it is:

echo "500 32000 128 512" > /proc/sys/kernel/sem
cat > workfile <<EOF
FILESIZE: 1M
POOLSIZE: 10M
10 link_test
EOF
mkdir -p /fs/shm
umount /fs/shm
mount -t tmpfs /dev/shm /fs/shm
echo "/fs/shm" > config

	(
		echo vm-lkp-a05-1
		echo link_test

		echo 1
		echo 2000
		echo 2
		echo 2000
		echo 1
	) | ./multitask -t

>
> Also, do you see the same problem with the upstream commit?
>
>   3cded4179481 ("x86/paravirt: Optimize native pv_lock_ops.vcpu_is_preemp=
ted()")

Sure.  I will test this commit and its parent.

Best Regards,
Huang, Ying

--===============3337039943803122561==--

