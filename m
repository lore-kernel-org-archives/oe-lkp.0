Content-Type: multipart/mixed; boundary="===============6499268951863088182=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 08:39:49 -0400
Message-ID: <6eb8226e-58b7-88cc-a8e4-35df47ae5688@linux.vnet.ibm.com>
In-Reply-To: <87vamv2pj0.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6499268951863088182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/14/2017 08:04 AM, Eric W. Biederman wrote:
> Stefan Berger <stefanb@linux.vnet.ibm.com> writes:
>
>> On 07/13/2017 08:38 PM, Eric W. Biederman wrote:
>>> Stefan Berger <stefanb@linux.vnet.ibm.com> writes:
>>>
>>>> On 07/13/2017 01:49 PM, Eric W. Biederman wrote:
>>>>
>>>>> My big question right now is can you implement Ted's suggested
>>>>> restriction.  Only one security.foo or secuirty.foo(a)... attribute ?
>>>> We need to raw-list the xattrs and do the check before writing them. I=
 am fairly sure this can be done.
>>>>
>>>> So now you want to allow security.foo and one security.foo(a)uid=3D<> =
or just a single one security.foo(@[[:print:]]*)?
>>>>
>>> The latter.
>> That case would prevent a container user from overriding the xattr on
>> the host. Is that what we want?
> Most definitely.  If a more privileged use has set secure.capable that
> is better.
>
>> For limiting the number of xattrs and
>> getting that functionality (override IMA signature for example) the
>> former seems better...
> I don't know about IMA.  But my feeling is that we will only be dealing
> with a single signing key, so I don't see how having multiple IMA xattrs
> make sense.  Could you explain that to me?

Admittedly I would need to construct and example where the user inside =

the container doesn't want to share the public key with the host on a =

file mounted from the host for some reason.

An example related to security.capability could be a Fedora Docker =

container where the container is distributed with the ping tool =

installed. The ping tool is installed with cap_net_admin,cap_net_raw+ep. =

On a normal Fedora container I cannot use this tool due to my =

capabilities bounding set not including cap_net_admin. So, I overwrite =

this and set only cap_net_raw+ep and I can use for pinging. I may loose =

some functionality on the way due to the lost cap_net_admin but I can =

now use the tool. I guess the point is one can override the capabilities =

set of a distributed container if the container is started with less =

capabilities.

    Stefan


>
>> For the former I now have the topmost patch here:
>> https://github.com/stefanberger/linux/commits/xattr_for_userns.v3
> Thank you.
>
> Eric
>


--===============6499268951863088182==--

