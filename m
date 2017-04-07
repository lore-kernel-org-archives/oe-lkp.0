Content-Type: multipart/mixed; boundary="===============8809061518689064114=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Fri, 07 Apr 2017 14:11:40 +0800
Message-ID: <20170407061140.GA5714@yexl-desktop>
In-Reply-To: <070BEF4AC20468458C22969097656CD94BFB568A@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8809061518689064114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/07, Li, Aubrey wrote:
>
>> =

>> I found your commit is not correct on inn,
>> =

>> $ cd /c/repo/linux
>> $ git show git show ea899bd65fc285d5753d70a7879a7332821bbc02
>> fatal: bad object ea899bd65fc285d5753d70a7879a7332821bbc02
>> =

>
>The commit id does not in Linux repo, it's in my fast_idle repo, which
>I specified in the command

I guess you haven't push your changes to git in bee?

# yexl @ bee in /gitmirror/aubrey-fast_idle on git:master o [14:14:09] C:128
$ git show ea899bd65fc285d5753d70a7879a7332821bbc02                 =

fatal: bad object ea899bd65fc285d5753d70a7879a7332821bbc02

Thanks,
Xiaolong

--===============8809061518689064114==--

