Content-Type: multipart/mixed; boundary="===============8098450782974686433=="
MIME-Version: 1.0
From: Daniel Borkmann <dborkman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [net] b58537a1f56: +89.2% netperf.Throughput_Mbps
Date: Thu, 19 Jun 2014 10:15:09 +0200
Message-ID: <53A29C0D.6080408@redhat.com>
In-Reply-To: <alpine.DEB.2.02.1406181340380.13111@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8098450782974686433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/18/2014 10:41 PM, David Rientjes wrote:
> On Wed, 18 Jun 2014, Daniel Borkmann wrote:
>
>> One assumption could be that netperf was setting this knob
>> internally and ignoring the result of it (error/success), but
>> that we might need to look up in netperf source to confirm.
>
> Confirmed netperf-2.4.5 doesn't do this.

Ok, thanks for checking, then I fully agree with you.

--===============8098450782974686433==--

