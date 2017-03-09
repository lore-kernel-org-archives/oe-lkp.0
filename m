Content-Type: multipart/mixed; boundary="===============3396265388141821729=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 23:07:32 +0100
Message-ID: <20170309220732.ufqoqlawktsi2gao@pd.tnic>
In-Reply-To: <20170309215547.jmdzznlkzaxwu2pf@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============3396265388141821729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 10:55:47PM +0100, Borislav Petkov wrote:
> Can you make that:
> =

> 	setup_clear_cpu_cap(X86_FEATURE_PGE);
> =

> and see if it fixes your issue?

Hmm, in reading the thread a bit more, that might not work. If I see it
correctly, lguest does

 clear_cpu_cap(&boot_cpu_data, X86_FEATURE_PGE);

after the alternatives have run and static_cpu_has() sites have already
been patched so clearing that bit won't bring anything.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============3396265388141821729==--

