Content-Type: multipart/mixed; boundary="===============1171515342171090530=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] 4bc0303aff: BUG: stack guard page was hit at ffffc900001bbff8
Date: Wed, 10 Aug 2016 01:16:55 -0700
Message-ID: <CALCETrWKAQQZXSNwbgk2pyGFeGQpcvkfSisdxXRsEwKF5b2zKQ@mail.gmail.com>
In-Reply-To: <20160808105835.26587bb7@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============1171515342171090530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 8, 2016 at 7:58 AM, Steven Rostedt <rostedt@goodmis.org> wrot=
e:
> On Mon, 8 Aug 2016 10:56:49 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
>> Yeah, looking at the error path, if registering an ops cause a
>> ftrace_bug, then ftrace is completely (well, mostly) which means that
>                                                       ^
> I left out the word...                             disabled
>
>> if the user unregistered the ops, nothing would happen. It which case,
>
>   "In which case"
>
>> if it freed the ops after it failed, then we can have this case.
>>
>
> Not enough coffee on this Monday morning.
>

I suspect I can't usefully reproduce this bug without or without the
patch -- it took 0day weeks to hit it.  Want to just take it via your
tree or send it to Ingo directly?

--===============1171515342171090530==--

