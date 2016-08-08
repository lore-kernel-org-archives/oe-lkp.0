Content-Type: multipart/mixed; boundary="===============0685040821064591899=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] 4bc0303aff: BUG: stack guard page was hit at ffffc900001bbff8
Date: Mon, 08 Aug 2016 10:58:35 -0400
Message-ID: <20160808105835.26587bb7@gandalf.local.home>
In-Reply-To: <20160808105649.1456e972@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============0685040821064591899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Aug 2016 10:56:49 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Yeah, looking at the error path, if registering an ops cause a
> ftrace_bug, then ftrace is completely (well, mostly) which means that
                                                      ^
I left out the word...                             disabled

> if the user unregistered the ops, nothing would happen. It which case,

  "In which case"

> if it freed the ops after it failed, then we can have this case.
> =


Not enough coffee on this Monday morning.

-- Steve

--===============0685040821064591899==--

