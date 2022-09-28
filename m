Content-Type: multipart/mixed; boundary="===============9050237904992059630=="
MIME-Version: 1.0
From: Nathan Chancellor <nathan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [objtool] ca5e2b42c0: kernel_BUG_at_arch/x86/kernel/jump_label.c
Date: Wed, 28 Sep 2022 13:45:13 -0700
Message-ID: <YzSyWWGsC0lGriYA@dev-arch.thelio-3990X>
In-Reply-To: <20220928191353.yu2o7rhkhpi3n74z@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============9050237904992059630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2022 at 12:13:53PM -0700, Josh Poimboeuf wrote:
> On Wed, Sep 28, 2022 at 08:44:27AM -0700, Nathan Chancellor wrote:
> > This crash appears to just be a symptom of objtool erroring throughout
> > the entire build, which means things like the jump label hacks do not
> > get applied. I see a flood of
> > =

> >   error: objtool: --mnop requires --mcount
> > =

> > throughout the build because the configuration has
> > CONFIG_HAVE_NOP_MCOUNT=3Dy because CONFIG_HAVE_OBJTOOL_MCOUNT is
> > unconditionally enabled for x86_64 due to CONFIG_HAVE_OBJTOOL but
> > '--mcount' is only actually used when CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
> > is enabled so '--mnop' gets passed in without '--mcount'. This should
> > obviously be fixed somehow, perhaps by moving the '--mnop' addition into
> > the '--mcount' if, even if that makes the line really long.
> > =

> > A secondary issue is that it seems like if objtool encounters a fatal
> > error like this, it should completely fail the build to make it obvious
> > that something is wrong, rather than allowing it to continue and
> > generate a broken kernel, especially since x86_64 requires objtool to
> > build a working kernel at this point.
> =

> Grrr... I really dislike that objtool is capable of bricking the kernel
> like this.  We just saw something similar in RHEL.
> =

> IMO, we should just get rid of this "short JMP" feature in the jump
> label code, those saved three bytes aren't worth the pain.
> =

> But yes, we do need to fix that config issue.

Right, I actually see that the report I was CC'd on was a part of a
larger thread, where Naveen already suggested the fix for this problem,
which is not clang specific it seems:

https://lore.kernel.org/1663223588.wppdx3129x.naveen(a)linux.ibm.com/

> And yes, maybe fatal objtool warnings should cause a build failure.  We
> used to do that, but it brought a different sort of pain.  But if
> objtool is going to be in the kernel's critical boot path then I guess
> we have to do that.

Right, that was

  644592d32837 ("objtool: Fail the kernel build on fatal errors")

which was reverted in

  655cf86548a3 ("objtool: Don't fail the kernel build on fatal errors")

objtool should not error on warnings but it seems like it should error
for invalid option combinations and other misconfiguration problems? Did
this regress with commit b51277eb9775 ("objtool: Ditch subcommands")? I
can see that the return code of the subcommands would be passed back via
exit() (?) so objtool could fail the build if there was a true problem
but after that change, objtool_run() does not have its return code
checked so any errors that happen don't get passed back up. Perhaps just
the following diff would resolve this? I assume we would need to look at
all the different return values to know if this is safe though.

Cheers,
Nathan

diff --git a/tools/objtool/objtool.c b/tools/objtool/objtool.c
index a7ecc32e3512..cda649644e32 100644
--- a/tools/objtool/objtool.c
+++ b/tools/objtool/objtool.c
@@ -146,7 +146,5 @@ int main(int argc, const char **argv)
 	exec_cmd_init("objtool", UNUSED, UNUSED, UNUSED);
 	pager_init(UNUSED);
 =

-	objtool_run(argc, argv);
-
-	return 0;
+	return objtool_run(argc, argv);
 }
--===============9050237904992059630==--

