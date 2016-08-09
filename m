Content-Type: multipart/mixed; boundary="===============5759786173043521693=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] 45ec18d5c7: BUG: KASAN: user-memory-access on address 00007f90291c7ec0
Date: Tue, 09 Aug 2016 11:18:32 +0800
Message-ID: <20160809031832.GD8668@yexl-desktop>
In-Reply-To: <20160809012756.GO2356@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5759786173043521693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/09, Al Viro wrote:
>On Tue, Aug 09, 2016 at 09:17:58AM +0800, Ye Xiaolong wrote:
>> On 08/08, Valdis.Kletnieks(a)vt.edu wrote:
>> >On Sun, 07 Aug 2016 22:02:42 +0800, kernel test robot said:
>> >
>> >> FYI, we noticed the following commit:
>> >>
>> >> https://github.com/0day-ci/linux
>> >> Nicholas-Krause/fs-Fix-kmemleak-leak-warning-in-getname_flags-about-w=
orking-on-unitialized-memory/20160804-055054
>> >> commit 45ec18d5c713bccb9807782f0dca29b92ba99784 ("fs:Fix kmemleak lea=
k warning in getname_flags about working on unitialized memory")
>> >
>> >The real question here is why the 0day system was even bothering to try
>> >compiling and booting a patch from somebody who has a long record of fa=
iling
>> >to do so with patches before submission.  Actually looking at the patch
>> >in question shows that little or no thought or testing was done (hint:
>> >look at it, and wonder in amazement why there's a dump_stack() call whe=
re
>> >it is....)
>> >
>> >In other words - how did this patch get into a tree that 0day listens t=
o?
>> =

>> 0Day has a service to automatically capture every patchset sent to LKML,=
 and convert
>> email patchset to git branches by applying them on top of different
>> trees heuristically.
>
>*raised eyebrows*
>
>I really hope they are doing both builds and testing in a heavily isolated
>environments, then.  Because you've just described an attack vector it's
>vulnerable to...

Yes, they are doing test in a heavily isolated environments with chroot,
no suid and isolated network.

--===============5759786173043521693==--

