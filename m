Content-Type: multipart/mixed; boundary="===============4796697661442686577=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fs/exec] 80bd5afdd8: xfstests.generic.633.fail
Date: Mon, 31 Jan 2022 13:59:40 -0800
Message-ID: <20220131135940.20790cff1747e79dd855aaf4@linux-foundation.org>
In-Reply-To: <20220131171344.77iifun5wdilbqdz@wittgenstein>
List-Id: <oe-lkp.lists.linux.dev>

--===============4796697661442686577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Jan 2022 18:13:44 +0100 Christian Brauner <brauner@kernel.org>=
 wrote:

> > in other words, the changes that you see CMD_ARGS[0] =3D=3D NULL for
> > execveat() seem higher than for path-based exec.
> > =

> > To counter that we should probably at least update the execveat()
> > manpage with a recommendation what CMD_ARGS[0] should be set to if it
> > isn't allowed to be set to NULL anymore. This is why was asking what
> > argv[0] is supposed to be if the binary doesn't take any arguments.
> =

> Sent a fix to our fstests now replacing the argv[0] as NULL with "".

As we hit this check so quickly, I'm thinking that Ariadne's patch
"fs/exec: require argv[0] presence in do_execveat_common()" (which
added the check) isn't something we'll be able to merge into mainline?
--===============4796697661442686577==--

