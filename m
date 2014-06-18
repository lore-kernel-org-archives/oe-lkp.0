Content-Type: multipart/mixed; boundary="===============6783740166300623705=="
MIME-Version: 1.0
From: Daniel Borkmann <dborkman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [net] b58537a1f56: +89.2% netperf.Throughput_Mbps
Date: Wed, 18 Jun 2014 22:38:49 +0200
Message-ID: <53A1F8D9.7070704@redhat.com>
In-Reply-To: <alpine.DEB.2.02.1406181328160.10339@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6783740166300623705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/18/2014 10:29 PM, David Rientjes wrote:
> On Wed, 18 Jun 2014, Jet Chen wrote:
>
>> Hi Daniel,
>>
>> FYI, we noticed the below changes on
>>
>> commit b58537a1f5629bdc98a8b9dc2051ce0e952f6b4b ("net: sctp: fix permiss=
ions
>> for rto_alpha and rto_beta knobs")
>
> There's no way this is legitimate, that commit cannot possibly affect the
> performance of netperf.  I wouldn't bother to spend any time investigating
> this.

One assumption could be that netperf was setting this knob
internally and ignoring the result of it (error/success), but
that we might need to look up in netperf source to confirm.

Cheers,

Daniel

--===============6783740166300623705==--

