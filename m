Content-Type: multipart/mixed; boundary="===============2166665937378696719=="
MIME-Version: 1.0
From: Casey Schaufler <casey@schaufler-ca.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/3] Enable namespaced file capabilities
Date: Fri, 23 Jun 2017 16:51:35 -0700
Message-ID: <59197179-8ef9-6be6-315f-41c10a8d7d06@schaufler-ca.com>
In-Reply-To: <da083027-fcd4-bc08-2d88-93034ba1cacc@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2166665937378696719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/23/2017 4:09 PM, Stefan Berger wrote:
> On 06/23/2017 02:35 PM, Serge E. Hallyn wrote:
>> Quoting Stefan Berger (stefanb(a)linux.vnet.ibm.com):
>>> On 06/23/2017 12:16 PM, Casey Schaufler wrote:
>>>> On 6/23/2017 9:00 AM, Serge E. Hallyn wrote:
>>>>> Quoting Amir Goldstein (amir73il(a)gmail.com):
>>>>>> On Thu, Jun 22, 2017 at 9:59 PM, Stefan Berger
>>>>>> <stefanb@linux.vnet.ibm.com> wrote:
>>>>>>> This series of patches primary goal is to enable file capabilities
>>>>>>> in user namespaces without affecting the file capabilities that are
>>>>>>> effective on the host. This is to prevent that any unprivileged user
>>>>>>> on the host maps his own uid to root in a private namespace, writes
>>>>>>> the xattr, and executes the file with privilege on the host.
>>>>>>>
>>>>>>> We achieve this goal by writing extended attributes with a different
>>>>>>> name when a user namespace is used. If for example the root user
>>>>>>> in a user namespace writes the security.capability xattr, the name
>>>>>>> of the xattr that is actually written is encoded as
>>>>>>> security.capability(a)uid=3D1000 for root mapped to uid 1000 on the=
 host.
>>>>>>> When listing the xattrs on the host, the existing security.capabili=
ty
>>>>>>> as well as the security.capability(a)uid=3D1000 will be shown. Insi=
de the
>>>>>>> namespace only 'security.capability', with the value of
>>>>>>> security.capability(a)uid=3D1000, is visible.
>>>>>>>
>>>>>> Am I the only one who thinks that suffix is perhaps not the best gra=
mmar
>>>>>> to use for this namespace?
>>>>> You're the only one to have mentioned it so far.
>>>>>
>>>>>> xattrs are clearly namespaced by prefix, so it seems right to me to =
keep
>>>>>> it that way - define a new special xattr namespace "ns" and only if =
that
>>>>>> prefix exists, the @uid suffix will be parsed.
>>>>>> This could be either  ns.security.capability(a)uid=3D1000 or
>>>>>> ns(a)uid=3D1000.security.capability. The latter seems more correct t=
o me,
>>>>>> because then we will be able to namespace any xattr without having to
>>>>>> protect from "unprivileged xattr injection", i.e.:
>>>>>> setfattr -n "user.whatever.foo(a)uid=3D0"
>>>>> I like it for simplifying the parser code.  One concern I have is tha=
t,
>>>>> since ns.* is currently not gated, one could write ns.* on an older
>>>>> kernel and then exploit it on a newer one.
>>>> security.ns.capability(a)uid=3D1000, then?
>>> Imo, '.ns' is redundant and 'encoded' in the '@'.
>> So how about
>>     security.(a)uid=3D1000@@capability ?
> Ouch.
>> Maybe it's not worth it.
>
> So the .ns is there to be able to possibly extend it in another dimension=
 in the future, like have '.foo' there at some point?

Traditionally we have <kind-of-attribute>.<name-of-attribute>
If you want to preserve the kind and name you have to introduce
a third component if you want to have it treated differently
under curtain (e.g. namespaced) conditions. You want to maintain
the kind, because that's already treated specially. You want to
maintain the name because that's what the feature code keys on.
The kind is expected to be first, and the name last, so your new
data needs to be in the middle. You need to identify what you
expect the new bit to be used for because if you're clever enough
to create a reason to add to the attribute name, someone else is,
too. Thus

	security.ns(a)uid=3D1000@@.capability
	security.endian(a)end=3Dbig@@.capability

It's better to add fields than to change how a field is
formatted and interpreted.



--===============2166665937378696719==--

