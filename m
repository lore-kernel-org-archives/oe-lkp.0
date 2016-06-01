Content-Type: multipart/mixed; boundary="===============8317016906873173303=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [oom_reaper] df1e2f5663: EIP: [<81e30134>] mmput_async+0x9/0x6b SS:ESP 0068:819a5e78
Date: Wed, 01 Jun 2016 10:55:49 +0200
Message-ID: <20160601085549.GI26601@dhcp22.suse.cz>
In-Reply-To: <20160601183748.6f72ca9c@canb.auug.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============8317016906873173303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 01-06-16 18:37:48, Stephen Rothwell wrote:
> Hi Michal,
> =

> On Wed, 1 Jun 2016 10:24:58 +0200 Michal Hocko <mhocko@kernel.org> wrot=
e:
> >
> > $ git describe next/master
> > next-20160601
> > $ git show df1e2f56632ddf17186f7036a3bd809d3aed8fd8:mm/oom_kill.c
> > fatal: Path 'mm/oom_kill.c' exists on disk, but not in 'df1e2f56632ddf1=
7186f7036a3bd809d3aed8fd8'
> =

> That's weird:

$ git show df1e2f56632ddf17186f7036a3bd809d3aed8fd8
fatal: bad object df1e2f56632ddf17186f7036a3bd809d3aed8fd8

But a collegue of mine has it and
$ git describe --contains df1e2f56632ddf17186f7036a3bd809d3aed8fd8
next-20160527~2^2~53

But my tree doesn't seem to have this tag
$ git show next-20160527
fatal: ambiguous argument 'next-20160527': unknown revision or path not in =
the working tree.

So it seemed to be in linux-next but it is not in next-20160601. It is
in the Linus tree as e2fe14564d33 ("oom_reaper: close race with exiting
task") reachable from next-20160527.
-- =

Michal Hocko
SUSE Labs

--===============8317016906873173303==--

