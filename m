Content-Type: multipart/mixed; boundary="===============4279710012464314341=="
MIME-Version: 1.0
From: Casey Schaufler <casey@schaufler-ca.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/3] Enable namespaced file capabilities
Date: Fri, 23 Jun 2017 13:30:01 -0700
Message-ID: <9eba9a52-80d4-8e31-4c2e-2dc601526765@schaufler-ca.com>
In-Reply-To: <20170623183520.GC21137@mail.hallyn.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4279710012464314341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/23/2017 11:35 AM, Serge E. Hallyn wrote:
> Quoting Stefan Berger (stefanb(a)linux.vnet.ibm.com):
>> On 06/23/2017 12:16 PM, Casey Schaufler wrote:
>>> On 6/23/2017 9:00 AM, Serge E. Hallyn wrote:
>>>> Quoting Amir Goldstein (amir73il(a)gmail.com):
>>>>> On Thu, Jun 22, 2017 at 9:59 PM, Stefan Berger
>>>>> <stefanb@linux.vnet.ibm.com> wrote:
>>>>>> This series of patches primary goal is to enable file capabilities
>>>>>> in user namespaces without affecting the file capabilities that are
>>>>>> effective on the host. This is to prevent that any unprivileged user
>>>>>> on the host maps his own uid to root in a private namespace, writes
>>>>>> the xattr, and executes the file with privilege on the host.
>>>>>>
>>>>>> We achieve this goal by writing extended attributes with a different
>>>>>> name when a user namespace is used. If for example the root user
>>>>>> in a user namespace writes the security.capability xattr, the name
>>>>>> of the xattr that is actually written is encoded as
>>>>>> security.capability(a)uid=3D1000 for root mapped to uid 1000 on the =
host.
>>>>>> When listing the xattrs on the host, the existing security.capability
>>>>>> as well as the security.capability(a)uid=3D1000 will be shown. Insid=
e the
>>>>>> namespace only 'security.capability', with the value of
>>>>>> security.capability(a)uid=3D1000, is visible.
>>>>>>
>>>>> Am I the only one who thinks that suffix is perhaps not the best gram=
mar
>>>>> to use for this namespace?
>>>> You're the only one to have mentioned it so far.
>>>>
>>>>> xattrs are clearly namespaced by prefix, so it seems right to me to k=
eep
>>>>> it that way - define a new special xattr namespace "ns" and only if t=
hat
>>>>> prefix exists, the @uid suffix will be parsed.
>>>>> This could be either  ns.security.capability(a)uid=3D1000 or
>>>>> ns(a)uid=3D1000.security.capability. The latter seems more correct to=
 me,
>>>>> because then we will be able to namespace any xattr without having to
>>>>> protect from "unprivileged xattr injection", i.e.:
>>>>> setfattr -n "user.whatever.foo(a)uid=3D0"
>>>> I like it for simplifying the parser code.  One concern I have is that,
>>>> since ns.* is currently not gated, one could write ns.* on an older
>>>> kernel and then exploit it on a newer one.
>>> security.ns.capability(a)uid=3D1000, then?
>> Imo, '.ns' is redundant and 'encoded' in the '@'.
> So how about
> 	security.(a)uid=3D1000@@capability ?

You're back to messing up the final component of the
attribute name. If you want a namespace component, keep
it separate. I disagree with the ".ns" being redundant.
It's descriptive.

	security.ns(a)uid=3D1000@@.capability.

looks right to me.

>
> Maybe it's not worth it.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-security-=
module" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--===============4279710012464314341==--

