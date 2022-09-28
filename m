Content-Type: multipart/mixed; boundary="===============2004728724423325714=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: lkp@lists.01.org
Subject: Re: [objtool] ca5e2b42c0: kernel_BUG_at_arch/x86/kernel/jump_label.c
Date: Wed, 28 Sep 2022 12:13:53 -0700
Message-ID: <20220928191353.yu2o7rhkhpi3n74z@treble>
In-Reply-To: <YzRr23Bn6qFDC7j0@dev-arch.thelio-3990X>
List-Id: <oe-lkp.lists.linux.dev>

--===============2004728724423325714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2022 at 08:44:27AM -0700, Nathan Chancellor wrote:
> This crash appears to just be a symptom of objtool erroring throughout
> the entire build, which means things like the jump label hacks do not
> get applied. I see a flood of
> =

>   error: objtool: --mnop requires --mcount
> =

> throughout the build because the configuration has
> CONFIG_HAVE_NOP_MCOUNT=3Dy because CONFIG_HAVE_OBJTOOL_MCOUNT is
> unconditionally enabled for x86_64 due to CONFIG_HAVE_OBJTOOL but
> '--mcount' is only actually used when CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
> is enabled so '--mnop' gets passed in without '--mcount'. This should
> obviously be fixed somehow, perhaps by moving the '--mnop' addition into
> the '--mcount' if, even if that makes the line really long.
> =

> A secondary issue is that it seems like if objtool encounters a fatal
> error like this, it should completely fail the build to make it obvious
> that something is wrong, rather than allowing it to continue and
> generate a broken kernel, especially since x86_64 requires objtool to
> build a working kernel at this point.

Grrr... I really dislike that objtool is capable of bricking the kernel
like this.  We just saw something similar in RHEL.

IMO, we should just get rid of this "short JMP" feature in the jump
label code, those saved three bytes aren't worth the pain.

But yes, we do need to fix that config issue.

And yes, maybe fatal objtool warnings should cause a build failure.  We
used to do that, but it brought a different sort of pain.  But if
objtool is going to be in the kernel's critical boot path then I guess
we have to do that.

-- =

Josh
--===============2004728724423325714==--

