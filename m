Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A0C3DB9B
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706568189; cv=none; b=U4jLN2DiuIv2IbjeHgamT2lBbInY7/C8vzp60qlXKdwQfxY7bL7AADkPIVUmUXSJcJaKlXItq1w012KUmbW9VemSVLddjtRuEwqeq0XU4vlaRlafI47pyx19RNtPh/smY+e2AB7171TXxZAGhRg8+3R4VR5R3fn3txxqIvXIW4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706568189; c=relaxed/simple;
	bh=p4fAypmGwh2MjrcCAAsFbLWW9Mlq0wjv4hcq1bO/MJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyVSvKhHtOmZ19658WM9ns1rfiV5zBbtEVdmE781kVC7VKchbxYT6wTzB8Lc98Q3FcbPQSjqB2Q6U3wpSufRIvE5fTXBPj+PU+wAE3jzrzS8W1jo6bwMc1456HWMBcLzyCP484RZDP9Cdg9nuhAENP0l7Bu8OB8v9nv+vLYuDIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LcdtBVv4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LcdtBVv4"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-510221ab3ebso4442141e87.1
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 14:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706568186; x=1707172986; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LygUeli+fkaFpTpY4T9pUkzxwshKh3bQFr+0h8Rxg7U=;
        b=LcdtBVv4WMPlSbQEubxsWUn1pBKag9oCmtKrHuzbYKjCOD6/O/pw0G0auLbSyRPN5/
         jjUamsSBhZhtCHKVsx2zjqoZelsHD86PNZipYe8D/O925Reqz3AWbtulZatQwuToWGZe
         UBuIR7e27UrV3AWVhzSQm7erm/kDg9F3yenAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706568186; x=1707172986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LygUeli+fkaFpTpY4T9pUkzxwshKh3bQFr+0h8Rxg7U=;
        b=RqDZQiNqw0adKktE4ZU3+HatUyX1k70sTsZzOklVB2QL5i27tmqGLQm6Y36FSepGG5
         PXnyzlllMNxGCNreOWg1Wc7WLL0AMt8Z6GkJxdvPM4x80fS0/7PpPlZlDFZyet7cmu5v
         Pk4RTA2cb+d0garUR0qmsDw4QPBctvh1CF0IqD3BTSAC1XQRh6bS/k+I4waLASO7O8Rj
         OdGNpAOQLduvTVJ+u9n3Q5S6aBuoEWMu0fsyDfg7Vt7ZO/kyFV4jJqYUnOfEbTGEMdUr
         1w46bC60wO3hNkUTnREA1iqquJ35R6vtO4S6qsFHiGhPLkLsaTvSmfIgv+e0v5m6sil8
         a8pg==
X-Gm-Message-State: AOJu0YytwkYxKHK83KGtif75aObhOfoeeG0tVokxM6ntqCcJxlqkQxS/
	h9Ra/ZsMjajAjfhz/69k+XXKAk3C995ddWawKqDgHzjzYsRZObTFigrJ/dr0iXUWfbL6KQs5uY2
	guTI=
X-Google-Smtp-Source: AGHT+IH9lorg9DbQKVM7CEI/MeIVS1mMVc1uwos29ErV8gDHK/I0o3DNA0BWqko+ErKNvauqpCDoSg==
X-Received: by 2002:a19:4316:0:b0:510:1624:d78a with SMTP id q22-20020a194316000000b005101624d78amr4171935lfa.48.1706568185950;
        Mon, 29 Jan 2024 14:43:05 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id c17-20020ac25f71000000b0051016409146sm1242748lfc.16.2024.01.29.14.43.04
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 14:43:04 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cf3a095ba6so38594741fa.2
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 14:43:04 -0800 (PST)
X-Received: by 2002:a2e:9958:0:b0:2cc:811f:f9ae with SMTP id
 r24-20020a2e9958000000b002cc811ff9aemr4489730ljj.47.1706568184184; Mon, 29
 Jan 2024 14:43:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
 <20240129120125.605e97af@gandalf.local.home> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
 <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
 <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
 <20240129152600.7587d1aa@gandalf.local.home> <CAHk-=wghobf5qCqNUsafkQzNAZBJiS0=7CRjNXNChpoAvTbvUw@mail.gmail.com>
 <20240129172200.1725f01b@gandalf.local.home> <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
In-Reply-To: <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jan 2024 14:42:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgOxTeTi02C=kOXsHzuD6XCrV0L1zk1XP9t+a4Wx--xvA@mail.gmail.com>
Message-ID: <CAHk-=wgOxTeTi02C=kOXsHzuD6XCrV0L1zk1XP9t+a4Wx--xvA@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000683a4e06101d5e02"

--000000000000683a4e06101d5e02
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 14:35, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So just replace all the d_instantiate() calls there with "d_add()"
> instead. I think that will fix it.

I can confirm that with the mutex deadlock removed and the d_add()
fix, at least things *look* superficially ok.

I didn't actually do anything with it. So it might be leaking dentry
refs like mad or something like that, but at least the obvious cases
look fine.

just for completeness, here's the fixup diff I used.

                  Linus

--000000000000683a4e06101d5e02
Content-Type: text/x-patch; charset="US-ASCII"; name="fixup.diff"
Content-Disposition: attachment; filename="fixup.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lrzim0me0>
X-Attachment-Id: f_lrzim0me0

IGZzL3RyYWNlZnMvZXZlbnRfaW5vZGUuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvdHJhY2Vmcy9l
dmVudF9pbm9kZS5jIGIvZnMvdHJhY2Vmcy9ldmVudF9pbm9kZS5jCmluZGV4IGNkNmRlMzI0NDQ0
Mi4uNWIzMDdiYjY0ZjhmIDEwMDY0NAotLS0gYS9mcy90cmFjZWZzL2V2ZW50X2lub2RlLmMKKysr
IGIvZnMvdHJhY2Vmcy9ldmVudF9pbm9kZS5jCkBAIC0yMzAsNyArMjMwLDYgQEAgc3RhdGljIHN0
cnVjdCBldmVudGZzX2lub2RlICpldmVudGZzX2ZpbmRfZXZlbnRzKHN0cnVjdCBkZW50cnkgKmRl
bnRyeSkKIHsKIAlzdHJ1Y3QgZXZlbnRmc19pbm9kZSAqZWk7CiAKLQltdXRleF9sb2NrKCZldmVu
dGZzX211dGV4KTsKIAlkbyB7CiAJCS8vIFRoZSBwYXJlbnQgaXMgc3RhYmxlIGJlY2F1c2Ugd2Ug
ZG8gbm90IGRvIHJlbmFtZXMKIAkJZGVudHJ5ID0gZGVudHJ5LT5kX3BhcmVudDsKQEAgLTI0Nyw3
ICsyNDYsNiBAQCBzdGF0aWMgc3RydWN0IGV2ZW50ZnNfaW5vZGUgKmV2ZW50ZnNfZmluZF9ldmVu
dHMoc3RydWN0IGRlbnRyeSAqZGVudHJ5KQogCQl9CiAJCS8vIFdhbGsgdXB3YXJkcyB1bnRpbCB5
b3UgZmluZCB0aGUgZXZlbnRzIGlub2RlCiAJfSB3aGlsZSAoIWVpLT5pc19ldmVudHMpOwotCW11
dGV4X3VubG9jaygmZXZlbnRmc19tdXRleCk7CiAKIAl1cGRhdGVfdG9wX2V2ZW50c19hdHRyKGVp
LCBkZW50cnktPmRfc2IpOwogCkBAIC0zMjQsNyArMzIyLDcgQEAgc3RhdGljIHN0cnVjdCBkZW50
cnkgKmxvb2t1cF9maWxlKHN0cnVjdCBkZW50cnkgKmRlbnRyeSwKIAl0aS0+ZmxhZ3MgPSBUUkFD
RUZTX0VWRU5UX0lOT0RFOwogCXRpLT5wcml2YXRlID0gTlVMTDsJCQkvLyBEaXJlY3RvcmllcyBo
YXZlICdlaScsIGZpbGVzIG5vdAogCi0JZF9pbnN0YW50aWF0ZShkZW50cnksIGlub2RlKTsKKwlk
X2FkZChkZW50cnksIGlub2RlKTsKIAlmc25vdGlmeV9jcmVhdGUoZGVudHJ5LT5kX3BhcmVudC0+
ZF9pbm9kZSwgZGVudHJ5KTsKIAlyZXR1cm4gZXZlbnRmc19lbmRfY3JlYXRpbmcoZGVudHJ5KTsK
IH07CkBAIC0zNjUsNyArMzYzLDcgQEAgc3RhdGljIHN0cnVjdCBkZW50cnkgKmxvb2t1cF9kaXJf
ZW50cnkoc3RydWN0IGRlbnRyeSAqZGVudHJ5LAogICAgICAgICBlaS0+ZGVudHJ5ID0gZGVudHJ5
OwkvLyBSZW1vdmUgbWUhCiAKIAlpbmNfbmxpbmsoaW5vZGUpOwotCWRfaW5zdGFudGlhdGUoZGVu
dHJ5LCBpbm9kZSk7CisJZF9hZGQoZGVudHJ5LCBpbm9kZSk7CiAJaW5jX25saW5rKGRlbnRyeS0+
ZF9wYXJlbnQtPmRfaW5vZGUpOwogCWZzbm90aWZ5X21rZGlyKGRlbnRyeS0+ZF9wYXJlbnQtPmRf
aW5vZGUsIGRlbnRyeSk7CiAJcmV0dXJuIGV2ZW50ZnNfZW5kX2NyZWF0aW5nKGRlbnRyeSk7CkBA
IC03ODYsNyArNzg0LDcgQEAgc3RydWN0IGV2ZW50ZnNfaW5vZGUgKmV2ZW50ZnNfY3JlYXRlX2V2
ZW50c19kaXIoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0IGRlbnRyeQogCiAJLyogZGlyZWN0b3J5
IGlub2RlcyBzdGFydCBvZmYgd2l0aCBpX25saW5rID09IDIgKGZvciAiLiIgZW50cnkpICovCiAJ
aW5jX25saW5rKGlub2RlKTsKLQlkX2luc3RhbnRpYXRlKGRlbnRyeSwgaW5vZGUpOworCWRfYWRk
KGRlbnRyeSwgaW5vZGUpOwogCWluY19ubGluayhkZW50cnktPmRfcGFyZW50LT5kX2lub2RlKTsK
IAlmc25vdGlmeV9ta2RpcihkZW50cnktPmRfcGFyZW50LT5kX2lub2RlLCBkZW50cnkpOwogCXRy
YWNlZnNfZW5kX2NyZWF0aW5nKGRlbnRyeSk7Cg==
--000000000000683a4e06101d5e02--
