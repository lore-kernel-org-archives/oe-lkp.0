Content-Type: multipart/mixed; boundary="===============5416385275588571457=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v4] Introduce v3 namespaced file capabilities
Date: Tue, 20 Jun 2017 13:33:55 -0400
Message-ID: <87dfaf3b-f466-9831-1c76-32d4cabd8cf6@linux.vnet.ibm.com>
In-Reply-To: <645d3a5e-4b76-cc90-50d6-4a7a7c3b678c@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5416385275588571457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/20/2017 08:19 AM, Stefan Berger wrote:
> On 06/20/2017 01:42 AM, Amir Goldstein wrote:
>> On Tue, Jun 20, 2017 at 12:34 AM, Eric W. Biederman
>> <ebiederm@xmission.com> wrote:
>>> "Serge E. Hallyn" <serge@hallyn.com> writes:
>>>
>>>> Quoting Stefan Berger (stefanb(a)linux.vnet.ibm.com):
>>>>> On 06/14/2017 11:05 PM, Serge E. Hallyn wrote:
>>>>>> On Wed, Jun 14, 2017 at 08:27:40AM -0400, Stefan Berger wrote:
>>>>>>> On 06/13/2017 07:55 PM, Serge E. Hallyn wrote:
>>>>>>>> Quoting Stefan Berger (stefanb(a)linux.vnet.ibm.com):
>>>>>>>>>   If all extended
>>>>>>>>> attributes were to support this model, maybe the 'uid' could be
>>>>>>>>> associated with the 'name' of the xattr rather than its =

>>>>>>>>> 'value' (not
>>>>>>>>> sure whether that's possible).
>>>>>>>> Right, I missed that in your original email when I saw it this =

>>>>>>>> morning.
>>>>>>>> It's not what my patch does, but it's an interesting idea.  Do =

>>>>>>>> you have
>>>>>>>> a patch to that effect?  We might even be able to generalize =

>>>>>>>> that to
>>>>>>> No, I don't have a patch. It may not be possible to implement it.
>>>>>>> The xattr_handler's  take the name of the xattr as input to get().
>>>>>> That may be ok though.  Assume the host created a container with
>>>>>> 100000 as the uid for root, which created a container with 130000 as
>>>>>> uid for root.  If root in the nested container tries to read the
>>>>>> xattr, the kernel can check for security.foo[130000] first, then
>>>>>> security.foo[100000], then security.foo.  Or, it can do a listxattr
>>>>>> and look for those.  Am I overlooking one?
>>>>>>
>>>>>>> So one could try to encode the mapped uid in the name. However, =

>>>>>>> that
>>>>>> I thought that's exactly what you were suggesting in your original
>>>>>> email?  "security.capability[uid=3D2000]"
>>>>>>
>>>>>>> could lead to problems with stale xattrs in a shared filesystem =

>>>>>>> over
>>>>>>> time unless one could limit the number of xattrs with the same
>>>>>>> prefix, e.g., security.capability*. So I doubt that it would work.
>>>>>> Hm.  Yeah.  But really how many setups are there like that?  I.e. if
>>>>>> you launch a regular docker or lxd container, the image doesn't do a
>>>>>> bind mount of a shared image, it layers something above it or does a
>>>>>> copy.  What setups do you know of where multiple containers in =

>>>>>> different
>>>>>> user namespaces mount the same filesystem shared and writeable?
>>>>> I think I have something now that accomodates userns access to
>>>>> security.capability:
>>>>>
>>>>> https://github.com/stefanberger/linux/commits/xattr_for_userns
>>>> Thanks!
>>>>
>>>>> Encoding of uid is in the attribute name now as follows:
>>>>> security.foo(a)uid=3D<uid>
>>>>>
>>>>> 1) The 'plain' security.capability is only r/w accessible from the
>>>>> host (init_user_ns).
>>>>> 2) When userns reads/writes 'security.capability' it will read/write
>>>>> security.capability(a)uid=3D<uid> instead, with uid being the uid of
>>>>> root , e.g. 1000.
>>>>> 3) When listing xattrs for userns the host's security.capability is
>>>>> filtered out to avoid read failures iof 'security.capability' if
>>>>> security.capability(a)uid=3D<uid> is read but not there. (see 1) and =
2))
>>>>> 4) security.capability* may all be read from anywhere
>>>>> 5) security.capability(a)uid=3D<uid> may be read or written directly
>>>>> from a userns if <uid> matches the uid of root (current_uid())
>>>> This looks very close to what we want.  One exception - we do want
>>>> to support root in a user namespace being able to write
>>>> security.capability(a)uid=3D<x> where <x> is a valid uid mapped in its
>>>> namespace.  In that case the name should be rewritten to be
>>>> security.capability(a)uid=3D<y> where y is the unmapped kuid.val.
>>>>
>>>> Eric,
>>>>
>>>> so far my patch hasn't yet hit Linus' tree.  Given that, would you
>>>> mind taking a look and seeing what you think of this approach?  If
>>>> we may decide to go this route, we probably should stop my patch
>>>> from hitting Linus' tree before we have to continue supporting it.
>>> Agreed.  I will take a look.  I also want to see how all of this works
>>> in the context of stackable filesystems.  As that is the one case that
>>> looked like it could be a problem case in your current patchset.
>>>
>> Apropos stackable filesystems [cc some overlayfs folks], is there any
>> way that parts of this work could be generalized towards ns aware
>> trusted(a)uid.* xattr?
>
> I am at least removing all string comparison with xattr names from the =

> core code and move the enabled xattr names into a list. For the =

> security.* extended attribute names we would enumerated the enabled =

> ones in that list, only security.capability for now. I am not sure how =

> the trusted.* space works.

I extended 'the infrastructure' now to support prefix matching for =

trusted.* and probably others as well. It's fairly easy to do that but =

would not write the code like that for exact string matching to support =

security.capability. The patch lets me write trusted.foo(a)uid=3D100 from =

within the userns if uid=3D100 exists, rejects it otherwise. It may be =

written out as trusted.foo(a)uid=3D1100 for root mapping to uid 1000. I can =

list this entry on the host. For some reason trusted.* is not listed at =

all inside the userns. So something else needs to be enabled as well. =

For now it looks like this:


https://github.com/stefanberger/linux/commit/8ae131e731c9e1def92a2100697632=
ea35e007d0

Regards,
     Stefan


--===============5416385275588571457==--

