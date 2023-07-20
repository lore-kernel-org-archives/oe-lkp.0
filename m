Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA380182C0
	for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 14:15:17 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-481604cb9d8so298240e0c.1
        for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 07:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689862516; x=1690467316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MQERya795CGhv2Pz7u9zEer8KNwsTeILm3cP6LQ0mAA=;
        b=XF0nOrc2JRgMC5HqpzzW/O+Vhrq7QQFop5Z/sZdQvGVOE+avykqZjwGwVH9UOZ+I+n
         sq7NDBcfXqy55BIq3BGqvOtIdL0zabi9f6zyXVj7Un8i7+P44XC53jP7DJ2T/ZZQiq08
         plItC6x4zDkFhfVb8ES+YUYWc4BKu6sDp8XOfgOmqzbsKy9s7LCeanI/Oz3VsBGagxSY
         CXK1vN+p9bRSrWIyzXUaaRq6KzSTUQg/6IiYHmgAwNb9ksnhXUk1HlP1AVz9F2l1iJV/
         dboiUWYmv/u7Xypc+D3pz8v/hDANW4r0PlwktvMiN0krWAoK69oD3QU0GwDVHjnWymW0
         +zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689862516; x=1690467316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQERya795CGhv2Pz7u9zEer8KNwsTeILm3cP6LQ0mAA=;
        b=YrGKGcbT3L4NJYyZ7Zjo4rJbE9lmLUHxGee5+3ScnYWE0h6+2HDDdS4IG8o2Daukjf
         Nxd056XfeLfzUPyyw3P2varQ10h3/OTox1D0gk0SjUrB/AwRJUAWda83lcC8w/lhTlGi
         h1BKiSWWtoX2NZEYMW9mLmGwQdQiCJTlpA08C1fXlxxf+A7HQg2fwcGG95P3yg1vxL4o
         0OhMGRU0XUWPEPcS7PthPNMponLARsIADNtgSEB5Th29l/8oZd0af7ADfvgHWnRpLN13
         QOS7qqygxoVCTp2YAD9V/J9X5KOoGH0xKwqzPmLZhjlamxTRsdTJ9mkYnlH59hzZB6K1
         mSzA==
X-Gm-Message-State: ABy/qLblSMFiftiUwSZKbBlfY5Z+5UvSaxSusZKK9fBn6t0sYTqcanej
	i5/KQ4tkC3Uzq+s/AIGK+0jqSXTLnDfMRdioF+c=
X-Google-Smtp-Source: APBJJlGhIz3jQRcLUTAXK1GegRixCfFrANLszRKfQk2JQmoZyGSE/hQOZXCEJGjpAvqnk+5QJVDXBiJswIAzmFjK9iE=
X-Received: by 2002:a1f:5ccb:0:b0:481:4cd1:d61e with SMTP id
 q194-20020a1f5ccb000000b004814cd1d61emr2577984vkb.13.1689862516145; Thu, 20
 Jul 2023 07:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com> <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020> <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
 <CAB=+i9Rn0WXgK-CfaKy0k7HXHx3VEmSjzopaPakcThSG5Ri3vA@mail.gmail.com>
In-Reply-To: <CAB=+i9Rn0WXgK-CfaKy0k7HXHx3VEmSjzopaPakcThSG5Ri3vA@mail.gmail.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Thu, 20 Jul 2023 23:15:04 +0900
Message-ID: <CAB=+i9SRCZ1OKBTrojbnbR2YgtmGoRiuTW4VBqvbW1=TNgVWMQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jay Patel <jaypatel@linux.ibm.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com, cl@linux.com, penberg@kernel.org, rientjes@google.com, 
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	aneesh.kumar@linux.ibm.com, tsahu@linux.ibm.com, piyushs@linux.ibm.com
Content-Type: multipart/mixed; boundary="000000000000fe94e70600ebc60a"

--000000000000fe94e70600ebc60a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 10:46=E2=80=AFPM Hyeonggon Yoo <42.hyeyoo@gmail.com=
> wrote:
>
> On Thu, Jul 20, 2023 at 9:59=E2=80=AFPM Hyeonggon Yoo <42.hyeyoo@gmail.co=
m> wrote:
> > On Thu, Jul 20, 2023 at 12:01=E2=80=AFPM Oliver Sang <oliver.sang@intel=
.com> wrote:
> > > > > commit:
> > > > >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/for-6=
.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next")
> > > > >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> > > > >
> > > > > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > > > > ---------------- ---------------------------
> > > > >          %stddev     %change         %stddev
> > > > >              \          |                \
> > > > >     222503 =C4=85 86%    +108.7%     464342 =C4=85 58%  numa-memi=
nfo.node1.Active
> > > > >     222459 =C4=85 86%    +108.7%     464294 =C4=85 58%  numa-memi=
nfo.node1.Active(anon)
> > > > >      55573 =C4=85 85%    +108.0%     115619 =C4=85 58%  numa-vmst=
at.node1.nr_active_anon
> > > > >      55573 =C4=85 85%    +108.0%     115618 =C4=85 58%  numa-vmst=
at.node1.nr_zone_active_anon
> > > >
> > > > I'm quite baffled while reading this.
> > > > How did changing slab order calculation double the number of active=
 anon pages?
> > > > I doubt two experiments were performed on the same settings.
> > >
> > > let me introduce our test process.
> > >
> > > we make sure the tests upon commit and its parent have exact same env=
ironment
> > > except the kernel difference, and we also make sure the config to bui=
ld the
> > > commit and its parent are identical.
> > >
> > > we run tests for one commit at least 6 times to make sure the data is=
 stable.
> > >
> > > such like for this case, we rebuild the commit and its parent's kerne=
l, the
> > > config is attached FYI.
>
> Oh I missed the attachments.
> I need more time to look more into that, but could you please test
> this patch (attached)?

Oh, my mistake. It has nothing to do with reclamation modifiers.
The correct patch should be this. Sorry for the noise.

--000000000000fe94e70600ebc60a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mm-slub-do-not-allocate-from-remote-node-to-allocate.patch"
Content-Disposition: attachment; 
	filename="0001-mm-slub-do-not-allocate-from-remote-node-to-allocate.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lkb8eg9g0>
X-Attachment-Id: f_lkb8eg9g0

RnJvbSA3NDE0MmI1MTMxZTczMWY2NjI3NDBkMzQ2MjNkOTNmZDMyNGY5YjY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIeWVvbmdnb24gWW9vIDw0Mi5oeWV5b29AZ21haWwuY29tPgpE
YXRlOiBUaHUsIDIwIEp1bCAyMDIzIDIyOjI5OjE2ICswOTAwClN1YmplY3Q6IFtQQVRDSF0gbW0v
c2x1YjogZG8gbm90IGFsbG9jYXRlIGZyb20gcmVtb3RlIG5vZGUgdG8gYWxsb2NhdGUgaGlnaAog
b3JkZXIgc2xhYgoKU2lnbmVkLW9mZi1ieTogSHllb25nZ29uIFlvbyA8NDIuaHlleW9vQGdtYWls
LmNvbT4KLS0tCiBtbS9zbHViLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tbS9zbHViLmMgYi9tbS9zbHViLmMKaW5k
ZXggZjc5NDAwNDgxMzhjLi5jNTg0MjM3ZDZhMGQgMTAwNjQ0Ci0tLSBhL21tL3NsdWIuYworKysg
Yi9tbS9zbHViLmMKQEAgLTIwMTAsNyArMjAxMCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2xhYiAqYWxs
b2NhdGVfc2xhYihzdHJ1Y3Qga21lbV9jYWNoZSAqcywgZ2ZwX3QgZmxhZ3MsIGludCBub2RlKQog
CSAqIExldCB0aGUgaW5pdGlhbCBoaWdoZXItb3JkZXIgYWxsb2NhdGlvbiBmYWlsIHVuZGVyIG1l
bW9yeSBwcmVzc3VyZQogCSAqIHNvIHdlIGZhbGwtYmFjayB0byB0aGUgbWluaW11bSBvcmRlciBh
bGxvY2F0aW9uLgogCSAqLwotCWFsbG9jX2dmcCA9IChmbGFncyB8IF9fR0ZQX05PV0FSTiB8IF9f
R0ZQX05PUkVUUlkpICYgfl9fR0ZQX05PRkFJTDsKKwlhbGxvY19nZnAgPSAoZmxhZ3MgfCBfX0dG
UF9USElTTk9ERSB8IF9fR0ZQX05PV0FSTiB8IF9fR0ZQX05PUkVUUlkpICYgfl9fR0ZQX05PRkFJ
TDsKIAlpZiAoKGFsbG9jX2dmcCAmIF9fR0ZQX0RJUkVDVF9SRUNMQUlNKSAmJiBvb19vcmRlcihv
bykgPiBvb19vcmRlcihzLT5taW4pKQogCQlhbGxvY19nZnAgPSAoYWxsb2NfZ2ZwIHwgX19HRlBf
Tk9NRU1BTExPQykgJiB+X19HRlBfUkVDTEFJTTsKIAotLSAKMi40MS4wCgo=
--000000000000fe94e70600ebc60a--
