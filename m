Content-Type: multipart/mixed; boundary="===============0598405504868663506=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill@shutemov.name>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/ftrace: Exclude functions in head64.c from function-tracing
Date: Tue, 27 Jun 2017 17:44:03 +0300
Message-ID: <20170627144403.wzzdqavodawi32yw@node.shutemov.name>
In-Reply-To: <20170627093825.0d0276ba@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============0598405504868663506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2017 at 09:38:25AM -0400, Steven Rostedt wrote:
> On Tue, 27 Jun 2017 14:59:48 +0300
> "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> =

> > We've moved most logic of early boot up from startup_64() written in
> > assembly to __startup_64() written in C.
> > =

> > Fengguang reported breakage due to the change. It was tracked down to
> > CONFIG_FUNCTION_TRACER being enabled.
> =

> Is this due to code that is in linux-next or is this issue currently in
> mainline?
> =

> If it is in linux-next, I'll give you:
> =

>  Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> =

> and you can take it. If the issue happens in current mainline, then I'll
> take it and push it out.

It's in -next.

Fixes: c88d71508e36 ("x86/boot/64: Rewrite startup_64() in C")

Although, I'm not sure if commit-id is stable yet.

-- =

 Kirill A. Shutemov

--===============0598405504868663506==--

