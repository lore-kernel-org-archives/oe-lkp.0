Content-Type: multipart/mixed; boundary="===============8315534874928465716=="
MIME-Version: 1.0
From: Chuck Ebbert <cebbert.lkml@gmail.com>
To: lkp@lists.01.org
Subject: Re: [net] 4ed2d765dfa: ltp.recv01.4.TFAIL
Date: Wed, 01 Oct 2014 11:20:39 -0500
Message-ID: <20141001112039.375338a0@as>
In-Reply-To: <542C2460.8020208@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8315534874928465716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 01 Oct 2014 17:57:20 +0200
Daniel Borkmann <dborkman@redhat.com> wrote:

> On 10/01/2014 05:29 PM, Fengguang Wu wrote:
> > Hi Willem,
> >
> > FYI, we noticed the below LTP failures on commit
> >
> > 4ed2d765dfaccff5ebdac68e2064b59125033a3b ("net-timestamp: TCP timestamp=
ing")
> =

> I think it already was discussed here:
> =

>    http://www.spinics.net/lists/netdev/msg297822.html


I've fixed one of those in LTP.

My proposed patch for how to fix the other three didn't get any replies
on the LTP list:

http://sourceforge.net/p/ltp/mailman/message/32866727/

--===============8315534874928465716==--

