Content-Type: multipart/mixed; boundary="===============5518046281874183511=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [iversion] c0cef30e4f: aim7.jobs-per-min -18.0% regression
Date: Tue, 27 Feb 2018 13:43:13 +0000
Message-ID: <666.1519738993@warthog.procyon.org.uk>
In-Reply-To: <1519738149.4300.45.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5518046281874183511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jeff Layton <jlayton@redhat.com> wrote:

>    0xffffffff813ae828 <+136>:	je     0xffffffff813ae83a <ima_file_free+15=
4>
>    0xffffffff813ae82a <+138>:	mov    0x150(%rbp),%rcx
>    0xffffffff813ae831 <+145>:	shr    %rcx
>    0xffffffff813ae834 <+148>:	cmp    %rcx,0x20(%rax)
>    0xffffffff813ae838 <+152>:	je     0xffffffff813ae862 <ima_file_free+19=
4>

Is it possible there's a stall between the load of RCX and the subsequent
instructions because they all have to wait for RCX to become available?

The interleaving between operating on RSI and RCX in the older code might
alleviate that.

In addition, the load if the 20(%rax) value is now done in the CMP instruct=
ion
rather than earlier, so it might not get speculatively loaded in time, wher=
eas
the earlier code explicitly loads it up front.

David

--===============5518046281874183511==--

