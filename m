Content-Type: multipart/mixed; boundary="===============5397412636017892524=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [net] b58537a1f56: +89.2% netperf.Throughput_Mbps
Date: Wed, 18 Jun 2014 13:29:03 -0700
Message-ID: <alpine.DEB.2.02.1406181328160.10339@chino.kir.corp.google.com>
In-Reply-To: <53A10291.7090301@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5397412636017892524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Jun 2014, Jet Chen wrote:

> Hi Daniel,
> =

> FYI, we noticed the below changes on
> =

> commit b58537a1f5629bdc98a8b9dc2051ce0e952f6b4b ("net: sctp: fix permissi=
ons
> for rto_alpha and rto_beta knobs")
> =


There's no way this is legitimate, that commit cannot possibly affect the =

performance of netperf.  I wouldn't bother to spend any time investigating =

this.

--===============5397412636017892524==--

