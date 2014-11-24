Content-Type: multipart/mixed; boundary="===============7497297704851358001=="
MIME-Version: 1.0
From: Willem de Bruijn <willemb@google.com>
To: lkp@lists.01.org
Subject: Re: [net] 4ed2d765dfa:
Date: Mon, 24 Nov 2014 10:55:37 -0500
Message-ID: <CA+FuTSfE5dU7TOzHB_X-esvMVJ=Q2MyrKaTJc7UzQV6vS7piew@mail.gmail.com>
In-Reply-To: <20141124123859.GD7310@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7497297704851358001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2014 at 7:38 AM, Yuanhan Liu
<yuanhan.liu@linux.intel.com> wrote:
> FYI, we noticed the below changes on
>
> commit 4ed2d765dfaccff5ebdac68e2064b59125033a3b ("net-timestamp: TCP time=
stamping")

> e7fd2885385157d4  4ed2d765dfaccff5ebdac68e20
> ----------------  --------------------------
>            :10         100%           5:5     ltp.recv01.fail
>            :10         100%           5:5     ltp.recvfrom01.fail
>            :10         100%           5:5     ltp.recvmsg01.fail

This has been discussed before:

  LTP recv/recvmsg tests failing on 3.17
  http://comments.gmane.org/gmane.linux.network/331750

and

  https://lkml.org/lkml/2014/10/1/379

--===============7497297704851358001==--

