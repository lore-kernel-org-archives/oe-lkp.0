Content-Type: multipart/mixed; boundary="===============3348878486473185170=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/3] Enable namespaced file capabilities
Date: Fri, 23 Jun 2017 13:38:45 -0400
Message-ID: <d288ea69-adec-f257-30cb-b1d9c57c996b@linux.vnet.ibm.com>
In-Reply-To: <1498237641.3641.15.camel@HansenPartnership.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3348878486473185170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/23/2017 01:07 PM, James Bottomley wrote:
> On Fri, 2017-06-23 at 11:30 -0500, Serge E. Hallyn wrote:
>> Quoting Casey Schaufler (casey(a)schaufler-ca.com):
>>> Or maybe just security.ns.capability, taking James' comment into
>>> account.
>> That last one may be suitable as an option, useful for his particular
>> (somewhat barbaric :) use case, but it's not ok for the general
>> solution.
>>
>> If uid 1000 was delegated the subuids 100000-199999, it should be
>> able to write a file capability for use by his subuids, but that file
>> capability must not apply to other subuids.
> I don't think it's barbaric, I think it's the common use case.  Let me
> give a more comprehensible answer in terms of docker and IMA.  Lets
> suppose I'm running docker locally and in a test cloud both with userns
> enabled.
>
> I build an image locally, mapping my uid (1000) to root.  If I begin
> with a standard base, each of the files has a security.ima signature.
>   Now I add my layer, which involves updating a file, so I need to write
> a new signature to security.ima.  Because I'm running user namespaced,
> the update gets written at security.ima(a)uid=3D1000 when I do a docker
> save.
>
> Now supposing I deploy that image to a cloud.  As a tenant, the cloud
> gives me real uid 4531 and maps that to root.  Execution of the binary
> fails because it tries to use the underlying signature (in
> security.ima) as there is no xattr named security.ima(a)uid=3D4531

Yes. An answer would be to have Docker rewrite these on the fly. It =

knows what uid the container was running as and specifically looks for =

security.ima(a)uid=3D1000 or security.ima, takes the former if it finds, =

otherwise the latter or nothing.

    Stefan

>
> So my essential point is that building the real kuid into the permanent
> record of the xattr damages image portability, which is touted as one
> of the real advantages of container images.
>
> James
>


--===============3348878486473185170==--

