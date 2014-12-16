Content-Type: multipart/mixed; boundary="===============7232007128205505590=="
MIME-Version: 1.0
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ipmi] BUG: key ffff880fcfc51ed0 not in .data!
Date: Mon, 15 Dec 2014 18:53:13 -0800
Message-ID: <CAADnVQJ8MT9mUbp2cyMOd-TUZh_fp+y35CGBiw+GEcbCRb+GrA@mail.gmail.com>
In-Reply-To: <548BBAB2.7010003@mvista.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7232007128205505590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2014 at 8:04 PM, Corey Minyard <cminyard@mvista.com> wrot=
e:
> On 12/11/2014 09:20 PM, Huang Ying wrote:
>> FYI, we noticed the below changes on
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> commit 2ed09fc090fc0488e2ab27604a141679fe2ef610 ("ipmi: clean up the dev=
ice handling for the bmc device")
>
> Thanks.  The surprising thing is that this didn't give an error before.
>
> But this should be fixed in linux-next the next time.

when specifically? Is there a fix already?
Quite annoying to see this every boot:
[    4.778018] BUG: key ffff88046458fe20 not in .data!
[    4.778021] ------------[ cut here ]------------
[    4.778061] WARNING: CPU: 1 PID: 1428 at
../kernel/locking/lockdep.c:2991 lockdep_init_map+0x4cd/0x500()

--===============7232007128205505590==--

