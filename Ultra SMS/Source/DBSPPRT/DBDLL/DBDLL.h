// DBDLL.h : DBDLL DLL ����ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// ������


// CDBDLLApp
// �йش���ʵ�ֵ���Ϣ������� DBDLL.cpp
//

class CDBDLLApp : public CWinApp
{
public:
	CDBDLLApp();

// ��д
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};


// �����ĺ���
#ifdef __cplusplus
extern "C"
{
#endif		// __cplusplus

// ����ĺ���
void WINAPI DBCompress(LPCTSTR lpSrc, LPCTSTR lpDest, LPCTSTR lpPassword);
void WINAPI DBCreate(LPCTSTR lpSrcPath);

#ifdef __cplusplus
}
#endif		// __cplusplus