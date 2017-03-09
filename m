Content-Type: multipart/mixed; boundary="===============6338973584529954392=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 22:55:47 +0100
Message-ID: <20170309215547.jmdzznlkzaxwu2pf@pd.tnic>
In-Reply-To: <58C1C9DC.7070509@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6338973584529954392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 10:32:12PM +0100, Daniel Borkmann wrote:
> 	get_online_cpus();
> 	if (boot_cpu_has(X86_FEATURE_PGE)) { /* We have a broader idea of "globa=
l". */
> 		/* Remember that this was originally set (for cleanup). */
> 		cpu_had_pge =3D 1;
> 		/*
> 		 * adjust_pge is a helper function which sets or unsets the PGE
> 		 * bit on its CPU, depending on the argument (0 =3D=3D unset).
> 		 */
> 		on_each_cpu(adjust_pge, (void *)0, 1);
> 		/* Turn off the feature in the global feature set. */
> 		clear_cpu_cap(&boot_cpu_data, X86_FEATURE_PGE);

Can you make that:

	setup_clear_cpu_cap(X86_FEATURE_PGE);

and see if it fixes your issue?

Thanks.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============6338973584529954392==--

