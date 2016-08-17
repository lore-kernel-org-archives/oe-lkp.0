Content-Type: multipart/mixed; boundary="===============4019807165781876444=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86/hweight] 65ea11ec6a: will-it-scale.per_process_ops 9.3% improvement
Date: Wed, 17 Aug 2016 08:48:00 +0200
Message-ID: <20160817064800.GN30192@twins.programming.kicks-ass.net>
In-Reply-To: <796A2A72-06B7-4B3D-AA38-DF558FC75857@zytor.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4019807165781876444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 04:09:19PM -0700, H. Peter Anvin wrote:
> On August 16, 2016 10:16:35 AM PDT, Borislav Petkov <bp@suse.de> wrote:
> >On Tue, Aug 16, 2016 at 09:59:00AM -0700, H. Peter Anvin wrote:
> >> Dang...
> >
> >Isn't 9.3% improvement a good thing(tm) ?
> =

> Yes, it's huge.  The only explanation I could imagine is that scrambling =
%rdi caused the scheduler to do completely the wrong thing.

Not entirely surprising. We have plenty bitmasks and if hweight is
corrupting the source data instead of computing the weight then we end
up having two bits of wrong information.

After that, all we can do is more wrong of course...

--===============4019807165781876444==--

