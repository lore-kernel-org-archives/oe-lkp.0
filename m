Content-Type: multipart/mixed; boundary="===============8054224389613899534=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Fri, 07 Apr 2017 11:44:22 +0800
Message-ID: <20170407034422.GP17682@yexl-desktop>
In-Reply-To: <070BEF4AC20468458C22969097656CD94BFB563C@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8054224389613899534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/07, Li, Aubrey wrote:
>Sorry, a few more questions
>
>> 2) $ lkp queue -b fast_idle -k <your head commitid> -t lkp-bdw-ep2 job.y=
aml -r 3
>
>how to specify the branch in fast_idle git tree? or lkp can find it automa=
tically by my head commit ID?

Mostly lkp can find it automatically by your commit id, and you can specify=
 it as '-b aubrey-fast_idle/<branch_name>'
explicitly as well.

>
>What does "-r 3" mean here?

Run 3 times for the same test.

Thanks,
Xiaolong
>
>Thanks,
>-Aubrey

--===============8054224389613899534==--

