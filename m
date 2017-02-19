Content-Type: multipart/mixed; boundary="===============1234043285844988412=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [clear_page] 0ad07c8104 BUG: unable to handle kernel NULL pointer dereference at 0000000000000040
Date: Sun, 19 Feb 2017 01:10:47 +0100
Message-ID: <20170219001047.ivdkkkmrml6bh5v3@pd.tnic>
In-Reply-To: <20170218232950.picqhk2xlmx3uh4l@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1234043285844988412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey Fengguang,

On Sun, Feb 19, 2017 at 07:29:50AM +0800, Fengguang Wu wrote:
> Good point! I noticed it too while sending out the report. It'll be
> showed as this in future:
> =

>        https://github.com/0day-ci/linux/commits/Borislav-Petkov/x86-Optim=
ize-clear_page/20170210-053052

How about pointing to the patch directly?

https://github.com/0day-ci/linux/commit/0ad07c8104eb5c12dfcb86581c1cc657183=
496cc

> Sorry the 2nd report was send out manually and I only checked the
> emails in my _current_ mbox. Since the previous report email has been
> archived, it slipped through the duplication check.

No worries - this was all a prelude to me hinting at the email-based
talking to the bot :-)

> CC Xiaolong. It's possible to automate the test-of-fixup-patches.
> Firstly find out the original email report by the Message-ID being
> replied to. Then fetch all the information required for deciding where
> the patch should be applied to, parameters to auto-testing the patch.

Sounds like a plan.

It would probably even be easier for the bot if the reply-mail contained
specially-formatted hints like:

TEST-WITH-BELOW-PATCH: ...

or so.

Btw, another nice aspect of this talking back to the bot is that before
I, as a recipient of the bug report, go and try to prepare a guest or
find a machine to reproduce properly, I can send a quick diff to the bot
in the meantime and say, "try this on the guest. I have a hunch it might
fix it."

> Yeah we have a TODO to do email based on-demand service, which looks
> close to your proposal.

Cool. Ping me if you need testers.

Thanks!

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============1234043285844988412==--

