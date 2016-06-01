Content-Type: multipart/mixed; boundary="===============6515632158120645086=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: [oom_reaper] df1e2f5663: EIP: [<81e30134>] mmput_async+0x9/0x6b SS:ESP 0068:819a5e78
Date: Wed, 01 Jun 2016 21:55:22 +1000
Message-ID: <20160601215522.31733a22@canb.auug.org.au>
In-Reply-To: <20160601085549.GI26601@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6515632158120645086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, 1 Jun 2016 10:55:49 +0200 Michal Hocko <mhocko@kernel.org> wrote:
>
> $ git show df1e2f56632ddf17186f7036a3bd809d3aed8fd8
> fatal: bad object df1e2f56632ddf17186f7036a3bd809d3aed8fd8
> =

> But a collegue of mine has it and
> $ git describe --contains df1e2f56632ddf17186f7036a3bd809d3aed8fd8
> next-20160527~2^2~53
> =

> But my tree doesn't seem to have this tag
> $ git show next-20160527
> fatal: ambiguous argument 'next-20160527': unknown revision or path not i=
n the working tree.

OK, that makes sense then.  But the "git show" error message could be a
bit better (something like "bad object", I guess).

> So it seemed to be in linux-next but it is not in next-20160601. It is
> in the Linus tree as e2fe14564d33 ("oom_reaper: close race with exiting
> task") reachable from next-20160527.

So when it hit Linus' tree, I would have removed it from my copy of
mmotm and, of course, its SHA will have changed since Andrew sends his
stuff as patches.

-- =

Cheers,
Stephen Rothwell

--===============6515632158120645086==--

