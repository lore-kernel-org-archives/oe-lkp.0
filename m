Content-Type: multipart/mixed; boundary="===============0865131229179533367=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [net] b58537a1f56: +89.2% netperf.Throughput_Mbps
Date: Wed, 18 Jun 2014 13:41:18 -0700
Message-ID: <alpine.DEB.2.02.1406181340380.13111@chino.kir.corp.google.com>
In-Reply-To: <53A1F8D9.7070704@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0865131229179533367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Jun 2014, Daniel Borkmann wrote:

> One assumption could be that netperf was setting this knob
> internally and ignoring the result of it (error/success), but
> that we might need to look up in netperf source to confirm.
> =


Confirmed netperf-2.4.5 doesn't do this.

--===============0865131229179533367==--

