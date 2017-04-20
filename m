Content-Type: multipart/mixed; boundary="===============4365896205382074220=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [x86/ftrace] 644e0e8dc7:
Date: Thu, 20 Apr 2017 11:44:03 -0400
Message-ID: <20170420114403.3962adb8@gandalf.local.home>
In-Reply-To: <20170420153049.k3uyonu36mbpgx6g@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============4365896205382074220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


[ Fixed Masami's email. I need to nuke the hitachi one from my address
  book. ]


Masami, here's the thread that I Cc'd your wrong email to.

 https://lists.01.org/pipermail/lkp/2017-April/006165.html

On Thu, 20 Apr 2017 10:30:49 -0500
Josh Poimboeuf <jpoimboe@redhat.com> wrote:


> > We need to load the parent into %edx and we use ebp for both FENTRY and
> > for MCOUNT. And 32 bit gets much more difficult than 64 bit, with the
> > requirement that regs is the address of the stack of where the kernel
> > took the breakpoint or the ftrace callback.  =

> =

> Does the &regs->sp thing really need to be a requirement here though?  I
> know it's due to a HW limitation, but these regs are created in SW.
> =

> If any ftrace users rely on that, could they just be changed to access
> regs->sp directly?  That would make it a lot easier to simplify this
> code.
> =


This is for the ftrace_regs_caller code which was specifically created
for kprobes. And its requirement was to simulate a hw interrupt. Thus,
it being a HW limitation, means it's also a ftrace_regs_caller
limitation.

Now would my last change work for you? How does the unwinder deal with
breakpoints?

-- Steve

--===============4365896205382074220==--

