Content-Type: multipart/mixed; boundary="===============4123825433839520512=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86_64, vsyscall] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Wed, 30 Jul 2014 13:14:06 -0700
Message-ID: <CALCETrXPesCD089zp6JHwaJc=JJb2FBRoFBCUj8DyCr2FjLCNA@mail.gmail.com>
In-Reply-To: <20140730153315.GA29233@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4123825433839520512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 8:33 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> On Wed, Jul 30, 2014 at 07:58:13AM -0700, Andy Lutomirski wrote:
>> On Wed, Jul 30, 2014 at 7:29 AM, Fengguang Wu <fengguang.wu@intel.com>=
 wrote:
>> > Greetings,
>> >
>> > 0day kernel testing robot got the below dmesg and the first bad commit=
 is
>> >
>> > git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/vsysc=
all
>> > commit 442aba0c6131f0c41dfc5edb6bfb88335556523f
>> > Author:     Andy Lutomirski <luto@amacapital.net>
>> > AuthorDate: Mon Jun 16 18:50:12 2014 -0700
>> > Commit:     Andy Lutomirski <luto@amacapital.net>
>> > CommitDate: Mon Jun 30 14:32:44 2014 -0700
>>
>> Was this a merge?
>
> It's not a merge commit.

Hmm.  It looks like that commit is from a version of x86/vsyscall
that's rather out-of-date.  Is it possible that the script is testing
an old version of the tree?  I haven't touched it in almost a week, I
think.

>
>> Is there an easy way to see exactly what was tested?
>
> This script may reproduce the error. Note that it's not 100% reproducible.

It fails with:

[    1.214573] VFS: Cannot open root device "ram0" or
unknown-block(0,0): error -6
[    1.216567] Please append a correct "root=3D" boot option; here are
the available partitions:
[    1.218692] 0b00         1048575 sr0  driver: sr

--Andy

--===============4123825433839520512==--

