Content-Type: multipart/mixed; boundary="===============3521953191491760176=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [signal/vm86_32] 1a4d21a23c: kernel_BUG_at_arch/x86/kernel/vm#_32.c
Date: Thu, 18 Nov 2021 10:24:41 -0600
Message-ID: <87czmxzb1y.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <20211118030547.GA12388@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3521953191491760176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oliver Sang <oliver.sang@intel.com> writes:

> hi Eric,
>
> On Fri, Nov 12, 2021 at 09:21:21AM -0600, Eric W. Biederman wrote:
>> kernel test robot <oliver.sang@intel.com> writes:
>> =

>> > Greeting,
>> >
>> > FYI, we noticed the following commit (built with gcc-9):
>> >
>> > commit: 1a4d21a23c4ca7467726be7db9ae8077a62b2c62 ("signal/vm86_32: Rep=
lace open coded BUG_ON with an actual BUG_ON")
>> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> >
>> > in testcase: trinity
>> > version: trinity-static-i386-x86_64-1c734c75-1_2020-01-06
>> > with following parameters:
>> >
>> > 	runtime: 300s
>> > 	group: group-00
>> >
>> > test-description: Trinity is a linux system call fuzz tester.
>> > test-url: http://codemonkey.org.uk/projects/trinity/
>> =

>> I am trying to figure out what to do with this, as it looks like I
>> converted a bug that was previously being ignored into a bug that is
>> being reported.
>> =

>> Is there a way to reliably run trinity such that it repeats the same
>> set of system calls?
>> =

>> I don't see that in the job_script?  Am I just missing that?
>
> have you tried our reproducer?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> To reproduce:
>
>         # build kernel
> 	cd linux
> 	cp config-5.15.0-rc1-00009-g1a4d21a23c4c .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> in lkp-tests/tests/trinity scripts, there is a 'seed' mechanism which
> calculates the seed correctly based on kernel info, then make sure
> trinity repeats the same set of system calls.
>
> BTW, by above reproducer, we can reproduce the issue locally.

It should be fixed in Linus' latest tree in commit c7a9b6471c8e
("signal/vm86_32: Remove pointless test in BUG_ON").

I did manage to run the reproducer.  I think I have the problem solved.
If not please let me know. =


I have to say the reproducer sucks to run.  The reproducer needs an open
network connection, something that violates the security policy on my
development machine.  Even to rerun the reproducer everything needs to
be downloaded again.  I really would prefer reproducers I could audit
and not give a network connection to, as that is a lot of code to give
free reign on one of my computers.

Eric
--===============3521953191491760176==--

