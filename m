Content-Type: multipart/mixed; boundary="===============3574118082182979482=="
MIME-Version: 1.0
From: Christian Brauner <brauner@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fs/exec] 80bd5afdd8: xfstests.generic.633.fail
Date: Tue, 01 Feb 2022 14:28:25 +0100
Message-ID: <20220201132825.zgl3fhnmhex5hcaw@wittgenstein>
In-Reply-To: <20220131135940.20790cff1747e79dd855aaf4@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3574118082182979482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 01:59:40PM -0800, Andrew Morton wrote:
> On Mon, 31 Jan 2022 18:13:44 +0100 Christian Brauner <brauner@kernel.or=
g> wrote:
> =

> > > in other words, the changes that you see CMD_ARGS[0] =3D=3D NULL for
> > > execveat() seem higher than for path-based exec.
> > > =

> > > To counter that we should probably at least update the execveat()
> > > manpage with a recommendation what CMD_ARGS[0] should be set to if it
> > > isn't allowed to be set to NULL anymore. This is why was asking what
> > > argv[0] is supposed to be if the binary doesn't take any arguments.
> > =

> > Sent a fix to our fstests now replacing the argv[0] as NULL with "".
> =

> As we hit this check so quickly, I'm thinking that Ariadne's patch
> "fs/exec: require argv[0] presence in do_execveat_common()" (which
> added the check) isn't something we'll be able to merge into mainline?

Not in the originally envisioned form. But I think Kees patch to make a
argv[0] the empty string when it's NULL has a better chance of
surviving.
--===============3574118082182979482==--

