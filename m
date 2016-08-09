Content-Type: multipart/mixed; boundary="===============6400375095685502327=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] 45ec18d5c7: BUG: KASAN: user-memory-access on address 00007f90291c7ec0
Date: Tue, 09 Aug 2016 11:20:12 +0800
Message-ID: <20160809032012.GE8668@yexl-desktop>
In-Reply-To: <8352.1470708920@turing-police.cc.vt.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============6400375095685502327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/08, Valdis.Kletnieks(a)vt.edu wrote:
>On Tue, 09 Aug 2016 09:17:58 +0800, Ye Xiaolong said:
>> On 08/08, Valdis.Kletnieks(a)vt.edu wrote:
>> > In other words - how did this patch get into a tree that 0day listens =
to?
>>
>> 0Day has a service to automatically capture every patchset sent to LKML
>
>Something's wrong then.  Nick has proven to be such a maintainer time-sink
>that he's not allowed to post to LKML - or any other list on vger.kernel.o=
rg.
>
>So how did he get past that and get 0day to see it?

We'll add a blacklist for it, Thanks.

--===============6400375095685502327==--

