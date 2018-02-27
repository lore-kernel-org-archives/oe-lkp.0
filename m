Content-Type: multipart/mixed; boundary="===============0829494797164203347=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [iversion] c0cef30e4f: aim7.jobs-per-min -18.0% regression
Date: Tue, 27 Feb 2018 10:27:50 -0500
Message-ID: <1519745270.4300.83.camel@redhat.com>
In-Reply-To: <666.1519738993@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0829494797164203347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-02-27 at 13:43 +0000, David Howells wrote:
> Jeff Layton <jlayton@redhat.com> wrote:
> =

> >    0xffffffff813ae828 <+136>:	je     0xffffffff813ae83a <ima_file_free+=
154>
> >    0xffffffff813ae82a <+138>:	mov    0x150(%rbp),%rcx
> >    0xffffffff813ae831 <+145>:	shr    %rcx
> >    0xffffffff813ae834 <+148>:	cmp    %rcx,0x20(%rax)
> >    0xffffffff813ae838 <+152>:	je     0xffffffff813ae862 <ima_file_free+=
194>
> =

> Is it possible there's a stall between the load of RCX and the subsequent
> instructions because they all have to wait for RCX to become available?
> =

> The interleaving between operating on RSI and RCX in the older code might
> alleviate that.
> =

> In addition, the load if the 20(%rax) value is now done in the CMP instru=
ction
> rather than earlier, so it might not get speculatively loaded in time, wh=
ereas
> the earlier code explicitly loads it up front.
> =


Thanks David, that makes sense.

At this point, I think we ought to wait and see what the results look
like without IMA compiled in at all.

It's possible we're misunderstanding this completely. At most, we'll be
hitting this once on every close of a file. It doesn't seem like that
ought to be causing something this noticeable though.
-- =

Jeff Layton <jlayton@redhat.com>

--===============0829494797164203347==--

