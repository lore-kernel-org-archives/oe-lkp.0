Content-Type: multipart/mixed; boundary="===============1914901207288136715=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Tue, 18 Jul 2017 12:11:06 -0400
Message-ID: <f56f6b87-fdc1-88d8-3b65-e73df5e79fb0@linux.vnet.ibm.com>
In-Reply-To: <20170718145716.GA25494@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1914901207288136715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/18/2017 10:57 AM, Vivek Goyal wrote:
> On Tue, Jul 18, 2017 at 09:21:22AM -0400, Stefan Berger wrote:
>> On 07/18/2017 08:30 AM, Vivek Goyal wrote:
>>> On Tue, Jul 18, 2017 at 08:05:18AM -0400, Stefan Berger wrote:
>>>> On 07/18/2017 07:48 AM, Vivek Goyal wrote:
>>>>> On Mon, Jul 17, 2017 at 04:50:22PM -0400, Stefan Berger wrote:
>>>>>> On 07/17/2017 02:58 PM, Vivek Goyal wrote:
>>>>>>> On Tue, Jul 11, 2017 at 11:05:11AM -0400, Stefan Berger wrote:
>>>>>>>
>>>>>>> [..]
>>>>>>>> +/*
>>>>>>>> + * xattr_list_userns_rewrite - Rewrite list of xattr names for us=
er namespaces
>>>>>>>> + *                             or determine needed size for attri=
bute list
>>>>>>>> + *                             in case size =3D=3D 0
>>>>>>>> + *
>>>>>>>> + * In a user namespace we do not present all extended attributes =
to the
>>>>>>>> + * user. We filter out those that are in the list of userns suppo=
rted xattr.
>>>>>>>> + * Besides that we filter out those with @uid=3D<uid> when there =
is no mapping
>>>>>>>> + * for that uid in the current user namespace.
>>>>>>>> + *
>>>>>>>> + * @list:        list of 0-byte separated xattr names
>>>>>>>> + * @size:        the size of the list; may be 0 to determine need=
ed list size
>>>>>>>> + * @list_maxlen: allocated buffer size of list
>>>>>>>> + */
>>>>>>>> +static ssize_t
>>>>>>>> +xattr_list_userns_rewrite(char *list, ssize_t size, size_t list_m=
axlen)
>>>>>>>> +{
>>>>>>>> +	char *nlist =3D NULL;
>>>>>>>> +	size_t s_off, len, nlen;
>>>>>>>> +	ssize_t d_off;
>>>>>>>> +	char *name, *newname;
>>>>>>>> +
>>>>>>>> +	if (!list || size < 0 || current_user_ns() =3D=3D &init_user_ns)
>>>>>>> size will never be less than 0 here. Only caller calls this functio=
n only
>>>>>>> if size is >0. So can we remove this?
>>>>>> Correct.
>>>>>>
>>>>>>> What about case of "!list". So if user space called listxattr(foo, =
NULL,
>>>>>>> 0), we want to return the size of buffer as if all the xattrs will =
be
>>>>>>> returned to user space. But in practice we probably will filter out=
 some
>>>>>>> xattrs so actually returned string will be smaller than size report=
ed
>>>>>>> previously.
>>>>>> This case of size=3D0 is a problem in userns. Depending on the mappi=
ng of the
>>>>>> userid's the list can expand. A security.foo(a)uid=3D100 can become
>>>>>> security.foo(a)uid=3D100000, if the mapping is set up so that uid 10=
0 on the
>>>>>> host becomes uid 100000 inside the container. So for now we only have
>>>>>> security.capability and the way I solved this is by allocating a 65k=
 buffer
>>>>>> when calling from a userns. In this buffer where we gather the xattr=
 names
>>>>>> and then walk them to determine the size that's needed for the buffe=
r by
>>>>>> simulating the rewriting. It's not nice but I don't know of any other
>>>>>> solution.
>>>>> Hi Stefan,
>>>>>
>>>>> For the case of size=3D=3D0, why don't we iterate through all the xat=
tr,
>>>>> filter them, remap them and then return the size to process in user
>>>>> namespace. That should fix this? I thought that's what
>>>> For the size=3D=3D0 we need a temp. buffer where the raw xattr names a=
re written
>>>> to so that the xattr_list_userns_rewrite() can actually rewrite what t=
he
>>>> filesystem drivers returned.
>>> I am probably missing something, but for the case of size=3D=3D0, we do=
n't
>>> have to copy all xattrs. We just need to determine size. So we can walk
>>> through each xattr, remap it and add to the size. I mean there should n=
ot
>>> be a need to allocate this 65K buffer. Just enough space needed to be
>>> able to store remapped xattr.
>>>
>>> You are already doing it in xattr_parse_uid_from_kuid(). It returns the
>>> buffer containing remapped xattr. So we should be able to just determine
>>> the size and free the buffer. And do it for all the xattrs returned by
>>> filesystem.
>>>
>>> What am I missing?
>> The problem is that each filesystem has a function that collects the xat=
tr
>> names. These functions only return the needed size if size=3D=3D0 and do=
n't
>> write anything into a buffer. If the buffer is empty or there is no buff=
er,
>> I have nothing to remap and calculate size for.
> How about calling listxattr() twice. In the first call you will get the
> size of buffer to allocate. Allocate that buffer and call ->listxattr()
> again, this time passing that buffer? That way you will not have to
> hardcode the size of buffer.

Good idea. I modified the code to do this now. Thanks.

    Stefan


--===============1914901207288136715==--

