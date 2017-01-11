Content-Type: multipart/mixed; boundary="===============0734185866091393570=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/4] lkp: add initial opensuse support
Date: Wed, 11 Jan 2017 09:52:01 +0800
Message-ID: <20170111015201.GB690@yexl-desktop>
In-Reply-To: <20170110142529.GE13946@wotan.suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0734185866091393570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/10, Luis R. Rodriguez wrote:

[snip]

>> >OK that runs, but that beats my actual machine with trinity, which is n=
ot
>> >desirable. I am trying to reproduce a reported error caught by lpk tests
>> >with trinity on my tree and that was with qemu. I have the job-script b=
ut
>> >that produces the same error with missing files. Can you help me with t=
hat?
>> =

>> Sure, could you paste the exact error log when you tried
>> "./bin/lkp qemu -k ~mcgrof/linux-next/arch/x86/boot/bzImage job-script"?
>
>As I noted its the same exact output, but here it is again:
>
>ergon:/home/mcgrof/devel/lkp-tests # export LKP_SRC=3D$PWD                =
                                     =

>ergon:/home/mcgrof/devel/lkp-tests # export PATH=3D$PATH:$LKP_SRC/bin =

>ergon:/home/mcgrof/devel/lkp-tests # ./bin/lkp qemu -k ~mcgrof/linux-next/=
arch/x86/boot/bzImage job-script
>job-script: line 2: $'\r': command not found
>job-script: line 3: syntax error near unexpected token `$'\r''
>'ob-script: line 3: `export_top_env()
>make: Entering directory '/home/mcgrof/devel/lkp-tests/bin/event'
>klcc    -c -o wakeup.o wakeup.c
>klcc  -static -o wakeup wakeup.o
>rm -f wakeup.o
>strip wakeup
>make: Leaving directory '/home/mcgrof/devel/lkp-tests/bin/event'
>cpio: lkp: Cannot stat: No such file or directory
>cpio: lkp/scheduled: Cannot stat: No such file or directory
>cpio: blank line ignored
>cpio: File /dev/mqueue/=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD shrunk by 20 b=
ytes, padding with zeros
>
>  Luis

Hmm, I believe it was caused by job-script saved as dos format, I can repro=
duce
it when I downloaded it through outlook attachment.

Try `dos2unix job-script` before "lkp qemu" to see whether it works.

Thanks,
Xiaolong

--===============0734185866091393570==--

