Content-Type: multipart/mixed; boundary="===============7361744450711483187=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Fri, 07 Apr 2017 06:51:14 +0000
Message-ID: <070BEF4AC20468458C22969097656CD94BFB570E@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <8760igaf87.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7361744450711483187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> > Should I add my task again after the commit is available or just wait?
> =

> I think it is better for you to queue the task again.  There is another h=
ole in
> queue implementation.  Your original queue should not succeed.
> Philip is working on that.
> =


Then I need to ask again, the same task are scheduled several times, how ar=
e their
reports handled? The newest one overwrites the old one? or all of the repor=
ts are
kept by the timestamp?

Thanks,
-Aubrey

--===============7361744450711483187==--

