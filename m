Content-Type: multipart/mixed; boundary="===============5170385303178223151=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: [oom_reaper] df1e2f5663: EIP: [<81e30134>] mmput_async+0x9/0x6b SS:ESP 0068:819a5e78
Date: Wed, 01 Jun 2016 18:37:48 +1000
Message-ID: <20160601183748.6f72ca9c@canb.auug.org.au>
In-Reply-To: <20160601082457.GH26601@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5170385303178223151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, 1 Jun 2016 10:24:58 +0200 Michal Hocko <mhocko@kernel.org> wrote:
>
> $ git describe next/master
> next-20160601
> $ git show df1e2f56632ddf17186f7036a3bd809d3aed8fd8:mm/oom_kill.c
> fatal: Path 'mm/oom_kill.c' exists on disk, but not in 'df1e2f56632ddf171=
86f7036a3bd809d3aed8fd8'

That's weird:

$ git describe
next-20160601
$ git show df1e2f56632ddf17186f7036a3bd809d3aed8fd8:mm/oom_kill.c | head -5
/*
 *  linux/mm/oom_kill.c
 * =

 *  Copyright (C)  1998,2000  Rik van Riel
 *	Thanks go out to Claus Fischer for some serious inspiration and

-- =

Cheers,
Stephen Rothwell

--===============5170385303178223151==--

