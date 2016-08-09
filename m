Content-Type: multipart/mixed; boundary="===============1212290644463978870=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] 45ec18d5c7: BUG: KASAN: user-memory-access on address 00007f90291c7ec0
Date: Tue, 09 Aug 2016 09:17:58 +0800
Message-ID: <20160809011758.GE8581@yexl-desktop>
In-Reply-To: <17429.1470673783@turing-police.cc.vt.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============1212290644463978870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/08, Valdis.Kletnieks(a)vt.edu wrote:
>On Sun, 07 Aug 2016 22:02:42 +0800, kernel test robot said:
>
>> FYI, we noticed the following commit:
>>
>> https://github.com/0day-ci/linux
>> Nicholas-Krause/fs-Fix-kmemleak-leak-warning-in-getname_flags-about-work=
ing-on-unitialized-memory/20160804-055054
>> commit 45ec18d5c713bccb9807782f0dca29b92ba99784 ("fs:Fix kmemleak leak w=
arning in getname_flags about working on unitialized memory")
>
>The real question here is why the 0day system was even bothering to try
>compiling and booting a patch from somebody who has a long record of faili=
ng
>to do so with patches before submission.  Actually looking at the patch
>in question shows that little or no thought or testing was done (hint:
>look at it, and wonder in amazement why there's a dump_stack() call where
>it is....)
>
>In other words - how did this patch get into a tree that 0day listens to?

0Day has a service to automatically capture every patchset sent to LKML, an=
d convert
email patchset to git branches by applying them on top of different
trees heuristically.



--===============1212290644463978870==--

